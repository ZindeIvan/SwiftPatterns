//
//  SearchSelectView.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/24/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SearchSelectView : UIView {
    
    
    private(set) lazy var appSearchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("App Search", for: .normal)
        button.backgroundColor = .varna
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private(set) lazy var songSearchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Song Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .varna
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUI() {
        self.backgroundColor = .white
        self.addSubview(appSearchButton)
        self.addSubview(songSearchButton)
        
        NSLayoutConstraint.activate([
            
            appSearchButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            appSearchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            appSearchButton.widthAnchor.constraint(equalToConstant: 120.0),
            appSearchButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            songSearchButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            songSearchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            songSearchButton.widthAnchor.constraint(equalToConstant: 120.0),
            songSearchButton.heightAnchor.constraint(equalToConstant: 32.0),
        ])
        
    }
    
    
    
}
