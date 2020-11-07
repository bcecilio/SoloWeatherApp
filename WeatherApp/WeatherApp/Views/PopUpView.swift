//
//  PopUpView.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 11/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class PopUpView: UIView {

    public var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Current City"
        return label
    }()
    
    public lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunrise Label"
        return label
    }()
    
    public lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunset Label"
        return label
    }()
    
    public lazy var highLow: UILabel = {
        let label = UILabel()
        label.text = "high:  low:"
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
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        setupContainer()
        setupStackView()
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
    
    private func setupStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
