//
//  PopUpView.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 11/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class PopUpView: UIView {

    fileprivate var cityLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var highLow: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cityLabel, sunriseLabel, highLow])
        stack.axis = .vertical
        return stack
    }()
    
    public var visualEffectView = UIVisualEffectView()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupContainer()
    }

    private func setupContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            container.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45)
        ])
    }
}
