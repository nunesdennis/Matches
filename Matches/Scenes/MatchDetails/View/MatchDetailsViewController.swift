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
    
    // MARK: - Properties
    
    var viewModel: MatchDetailsViewModelProtocol
    
    // MARK: - Subviews
    
    private lazy var opponentVersusView: OpponentVersusView? = {
        guard let viewModel = viewModel.opponentVersusViewModel else {
            return nil
        }
        
        return OpponentVersusView(opponentVersusViewModel: viewModel)
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
