//
//  MatchDetailsViewController.swift
//  Matches
//
//  Created by Dennis Nunes on 10/04/23.
//

import UIKit

protocol MatchDetailsViewControllerProtocol where Self: UIViewController {}

final class MatchDetailsViewController: UIViewController {
    // MARK: - Properties
    
    var viewModel: MatchDetailsViewModelProtocol
    
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
//        view.addSubview()
//
//        NSLayoutConstraint.activate([
//        ])
    }
    
    private func setupNavigation() {
        title = viewModel.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension MatchDetailsViewController: MatchesViewControllerProtocol {}
