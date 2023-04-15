//
//  LoadedNumberView.swift
//  Matches
//
//  Created by Dennis Nunes on 15/04/23.
//

import UIKit

final class LoadedNumberView: UIView {
    // MARK: - Constants
    
    private var viewCornerRadius: CGFloat = Space.base08
    
    // MARK: - Private Properties
    
    private var loadedNumber: Int
    
    // MARK: - Subviews
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+\(loadedNumber)"
        label.textColor = .nero
        label.textAlignment = .center
        label.font = UIFont(name: FontName.robotoRegular, size: FontSize.base09)
        
        return label
    }()
    
    // MARK: Initialization

    init(loadedNumber: Int) {
        self.loadedNumber = loadedNumber
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        setupRoundCorner()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: - Private Methods
    
    private func setupRoundCorner() {
        layer.cornerRadius = viewCornerRadius
    }
    
    private func setupContraints() {
        addSubview(numberLabel)

        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Space.base04),
            numberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Space.base04),
            numberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Space.base04),
            numberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Space.base04)
        ])
    }
    
    // MARK: - Public Methods
    
    public func updateNumber(_ loadedNumber: Int) {
        self.loadedNumber = loadedNumber
        numberLabel.text = "+\(loadedNumber)"
    }
}
