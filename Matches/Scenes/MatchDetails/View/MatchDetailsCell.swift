//
//  MatchDetailsCell.swift
//  Matches
//
//  Created by Dennis Nunes on 10/04/23.
//

import UIKit

final class MatchDetailsCell: UITableViewCell {
    // MARK: - Properties
    
    var viewModel: MatchDetailsCellViewModel?
    
    // MARK: - Public Methods

    func setupView(with viewModel: MatchDetailsCellViewModel){
        self.viewModel = viewModel
        backgroundColor = .clear
        selectionStyle = .none
        contentView.backgroundColor = .clear
        needsUpdateConstraints()
        setupContraints()
    }
  
    // MARK: - Private Methods

    private func setupContraints() {
        // TODO: // Needs to add views and constraints
    }
}
