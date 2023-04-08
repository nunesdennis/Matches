//
//  CardView.swift
//  Matches
//
//  Created by Dennis Nunes on 08/04/23.
//

import UIKit

class CardView: UIView {
    // MARK: - Constants
    
    var opponentVersusViewHeight: CGFloat = 45.0
    var leagueSerieViewBottomAnchor: CGFloat = -Space.base04
    var leagueSerieViewLeadingAnchor: CGFloat = 15.0
    
    // MARK: - Properties
    
    var viewModel: CardViewModel
    
    // MARK: - Subviews
    
    private lazy var opponentVersusView: OpponentVersusView = {
        let viewModel = viewModel.opponentVersusViewModel
        
        return OpponentVersusView(opponentVersusViewModel: viewModel)
    }()
    
    private lazy var leagueSerieView: LeagueSerieView = {
        let viewModel = viewModel.leagueSerieViewModel
        let view = LeagueSerieView(leagueSerieViewModel: viewModel)
//        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var matchTimeView: MatchTimeView = {
        let viewModel = viewModel.matchTimeViewModel
        
        return MatchTimeView(matchTimeViewModel: viewModel)
    }()
    
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [opponentVersusView, leagueSerieView])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.spacing = Space.base04
//        stackView.axis = .vertical
//
//        return stackView
//    }()

    // MARK: Initialization

    init(with viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 16
        backgroundColor = .valhalla
    }
    
    private func setupContraints() {
        addSubview(matchTimeView)
        addSubview(opponentVersusView)
        addSubview(leagueSerieView)
        
        NSLayoutConstraint.activate([
            opponentVersusView.topAnchor.constraint(equalTo: self.topAnchor, constant: opponentVersusViewHeight),
            opponentVersusView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            matchTimeView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            matchTimeView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            leagueSerieView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: leagueSerieViewBottomAnchor),
            leagueSerieView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leagueSerieViewLeadingAnchor)
        ])
    }
}
