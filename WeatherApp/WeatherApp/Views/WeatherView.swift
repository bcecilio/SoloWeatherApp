//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    public lazy var textField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Zip Code"
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.default
        field.returnKeyType = UIReturnKeyType.done
        field.textAlignment = .center
        return field
    }()
    
    public lazy var collectionView: UICollectionView = {
        let collection = UICollectionView()
        
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupTextField()
        setUpCollectionView()
    }
    
    private func setupTextField() {
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 20),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 20),
            collectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 10),
            collectionView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -10)
        ])
    }
}
