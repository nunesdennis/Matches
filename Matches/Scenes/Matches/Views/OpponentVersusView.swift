//
//  OpponentVersusView.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

class OpponentVersusView: UIView {
    // MARK: - Constants
    
    enum Alpha {
        static let half = 0.5
    }
    
    var versusLabelTitle: String { Localized("Matches.TableView.MatchCell.Versus.title") }
    
    // MARK: - Properties
    
    var viewModel: OpponentVersusViewModel
    
    // MARK: - Subviews
    
    private lazy var leftOpponentView: OpponentView = {
        OpponentView(opponentViewModel: viewModel.leftOpponent)
    }()
    private lazy var rightOpponentView: OpponentView = {
        OpponentView(opponentViewModel: viewModel.rightOpponent)
    }()
    private lazy var versusLabel: UILabel = {
        let label = UILabel()
        label.text = versusLabelTitle
        label.textColor = .white.withAlphaComponent(Alpha.half)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
//        label.font = UIFont(name: "Roboto-Regular", size: FontSize.base06)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftOpponentView, versusLabel, rightOpponentView])
        stackView.spacing = Space.base10
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: Initialization

    init(opponentVersusViewModel: OpponentVersusViewModel) {
        viewModel = opponentVersusViewModel
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
            versusLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            versusLabel.widthAnchor.constraint(equalToConstant: 25.0)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func Localized(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
