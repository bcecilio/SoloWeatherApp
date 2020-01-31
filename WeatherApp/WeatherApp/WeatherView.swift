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
        
    }
}
