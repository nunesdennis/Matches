//
//  TeamView.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

class OpponentView: UIView {
    // MARK: - Properties
    
    var viewModel: OpponentViewModel
    
    // MARK: - Subviews
    
    private lazy var opponentImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.image = viewModel.image
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    private lazy var opponentNameLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.name
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: "Roboto-Regular", size: FontSize.base05)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [opponentImage, opponentNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Space.base05
        stackView.axis = .vertical
        
        return stackView
    }()
    
    // MARK: - Initialization

    init(opponentViewModel: OpponentViewModel) {
        viewModel = opponentViewModel
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: - Private Methods
    
    private func setupContraints() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            opponentImage.heightAnchor.constraint(equalToConstant: Space.base30),
            opponentImage.widthAnchor.constraint(equalToConstant: Space.base30)
        ])
        
        NSLayoutConstraint.activate([
            opponentNameLabel.heightAnchor.constraint(equalToConstant: Space.base08),
            opponentNameLabel.widthAnchor.constraint(equalToConstant: Space.base30)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
