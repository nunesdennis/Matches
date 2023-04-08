//
//  LeagueSerieView.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

class LeagueSerieView: UIView {
    // MARK: - Properties
    
    var viewModel: LeagueSerieViewModel
    
    // MARK: - Subviews
    
    private lazy var leagueSerieImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.image = viewModel.image
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    private lazy var leagueSerieLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.title
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: "Roboto-Regular", size: FontSize.base04)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leagueSerieImage, leagueSerieLabel])
        stackView.spacing = Space.base04
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: Initialization

    init(leagueSerieViewModel: LeagueSerieViewModel) {
        viewModel = leagueSerieViewModel
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
            leagueSerieImage.heightAnchor.constraint(equalToConstant: Space.base08),
            leagueSerieImage.widthAnchor.constraint(equalToConstant: Space.base08)
        ])
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: Space.base08),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
