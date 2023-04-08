//
//  ViewControllerEssentialProtocol.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

protocol ViewControllerEssentialProtocol where Self: UIViewController {
    var spinner: UIActivityIndicatorView { get set }
}

extension ViewControllerEssentialProtocol {
    func setupLargeCentralSpinner() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        self.spinner = spinner
    }
    
    func showAlert(with title: String, message: String, andButtonTitle buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}
