//
//  ViewController.swift
//  Matches
//
//  Created by Dennis Nunes on 04/04/23.
//

import UIKit

protocol MatchesViewControllerProtocol where Self: UIViewController {}

class MatchesViewController: UIViewController {
    // MARK: - Properties
    var viewModel: MatchesViewModelProtocol?
    
    // MARK: - Initialization
    convenience init(viewModel: MatchesViewModel){
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        viewModel?.serviceTest()
    }
}

extension MatchesViewController: MatchesViewControllerProtocol {}
