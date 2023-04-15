//
//  MatchTimeView.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

final class MatchTimeView: UIView {
    // MARK: - Constants
    
    var labelHeight: CGFloat = 10.0
    var labelWidth: CGFloat = 50.0
    var viewCornerRadius: CGFloat = Space.base08
    
    // MARK: - Properties
    
    var viewModel: MatchTimeViewModel
    
    // MARK: - Subviews
    
    private lazy var matchTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.formattedTime()
        label.textColor = viewModel.titleColor()
        label.textAlignment = .center
        label.font = UIFont(name: FontName.robotoRegular, size: FontSize.base04)
        
        return label
    }()
    
    // MARK: Initialization

    init(matchTimeViewModel: MatchTimeViewModel) {
        viewModel = matchTimeViewModel
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: - Private Methods

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = viewModel.backgroundColor()
        setupRoundCorner()
        setupContraints()
    }
    
    private func setupRoundCorner() {
        layer.cornerRadius = viewCornerRadius
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }
    
    private func setupContraints() {
        addSubview(matchTimeLabel)

        NSLayoutConstraint.activate([
            matchTimeLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            matchTimeLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            matchTimeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Space.base04),
            matchTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Space.base04),
            matchTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Space.base04),
            matchTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Space.base04)
        ])
    }
}
