//
//  MatchDetailsViewController.swift
//  Matches
//
//  Created by Dennis Nunes on 10/04/23.
//

import UIKit

protocol MatchDetailsViewControllerProtocol where Self: UIViewController {}

final class MatchDetailsViewController: UIViewController {
    // MARK: - Constants
    
    var opponentVersusViewTopAnchor: CGFloat = Space.base08
    let cellRowHeight: CGFloat = 60
    
    // MARK: - Properties
    
    var viewModel: MatchDetailsViewModelProtocol
    
    // MARK: - Subviews
    
    private lazy var opponentVersusView: OpponentVersusView? = {
        guard let viewModel = viewModel.opponentVersusViewModel else {
            return nil
        }
        
        return OpponentVersusView(opponentVersusViewModel: viewModel)
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = cellRowHeight
        tableView.register(MatchDetailsCell.self, forCellReuseIdentifier: String(describing: MatchDetailsCell.self))
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        
        return tableView
    }()
    
    // MARK: - Initialization
    
    init(viewModel: MatchDetailsViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .nero
        setupNavigation()
        setupConstraints()
    }
    
    // MARK: - Private Methods

    private func setupConstraints() {
        guard let opponentVersusView = opponentVersusView else {
            return
        }
        view.addSubview(opponentVersusView)

        NSLayoutConstraint.activate([
            opponentVersusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: opponentVersusViewTopAnchor),
            opponentVersusView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupNavigation() {
        title = viewModel.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension MatchDetailsViewController: MatchesViewControllerProtocol {}

// MARK: - TableView

extension MatchDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MatchDetailsCell.self), for: indexPath) as? MatchDetailsCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

extension MatchDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Intentionally empty
    }
}
