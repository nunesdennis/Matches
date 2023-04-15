//
//  ViewController.swift
//  Matches
//
//  Created by Dennis Nunes on 04/04/23.
//

import UIKit

protocol MatchesViewControllerProtocol where Self: UIViewController {}

final class MatchesViewController: UIViewController, ViewControllerEssentialProtocol {
    // MARK: - Constants
    
    let cellRowHeight: CGFloat = 200
    
    // MARK: - Subviews
    
    var spinner = UIActivityIndicatorView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = cellRowHeight
        tableView.register(MatchCell.self, forCellReuseIdentifier: String(describing: MatchCell.self))
        tableView.backgroundView = spinner
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = .white
        tableView.refreshControl?.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
        
        return tableView
    }()
    
    // MARK: - Private Properties
    
    private var isLoading = false
    
    // MARK: - Properties
    
    var cardsViewModel: [CardViewModel] = []
    var viewModel: MatchesViewModelProtocol
    
    // MARK: - Initialization
    
    init(viewModel: MatchesViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .nero
        setupLargeCentralSpinner()
        setupConstraints()
        loadMatches()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    // MARK: - Private Methods

    private func setupConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func setupNavigation() {
        title = viewModel.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func updateList(_ needsReset: Bool, modelList: [CardViewModel]) {
        if needsReset {
            cardsViewModel = modelList
        } else {
            cardsViewModel.append(contentsOf: modelList)
        }
    }
    
    private func loadMatches(didPullToRefresh: Bool = false) {
        isLoading = true
        viewModel.loadMatches(didPullToRefresh) { [unowned self] result in
            switch result {
            case .success(let cardViewModelList):
                updateList(didPullToRefresh, modelList: cardViewModelList)
                DispatchQueue.main.async { [unowned self] in
                    tableView.refreshControl?.endRefreshing()
                    tableView.reloadData()
                    spinner.stopAnimating()
                    isLoading = false
                }
                
            case .failure(let error):
                isLoading = false
                showAlert(with: error.title, message: error.description, andButtonTitle: error.buttonName)
            }
        }
    }
    
    @objc
    private func pulledToRefresh() {
        loadMatches(didPullToRefresh: true)
    }
}

extension MatchesViewController: MatchesViewControllerProtocol {}

// MARK: - TableView

extension MatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MatchCell.self), for: indexPath) as? MatchCell else {
            return UITableViewCell()
        }
        
        let cardViewModel = cardsViewModel[indexPath.row]
        cell.setupView(with: cardViewModel, andIndex: indexPath.row)
        
        return cell
    }
}

extension MatchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cardViewModel = cardsViewModel[indexPath.row]
        let match = cardViewModel.getMatchDetails()
        viewModel.openDetails(of: match)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let shouldLoad = offsetY > (contentHeight - scrollView.frame.height)
        
        if shouldLoad && !isLoading {
            loadMatches()
        }
    }
}
