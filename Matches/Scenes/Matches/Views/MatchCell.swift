//
//  MatchCell.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

class MatchCell: UITableViewCell {
    // MARK: - Properties
    
    var viewModel: CardViewModel?
    
    // MARK: - Subviews
    
    private lazy var cardView: CardView? = {
        guard let viewModel = viewModel else {
            return nil
        }
        
        return CardView(with: viewModel)
    }()
    
    // MARK: - Public Methods

    func setupView(with viewModel: CardViewModel){
        self.viewModel = viewModel
        backgroundColor = .clear
        selectionStyle = .none
        contentView.backgroundColor = .clear
        needsUpdateConstraints()
        setupContraints()
    }
  
    // MARK: - Private Methods

    private func setupContraints() {
        guard let cardView = cardView else {
            return
        }
        
        contentView.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
