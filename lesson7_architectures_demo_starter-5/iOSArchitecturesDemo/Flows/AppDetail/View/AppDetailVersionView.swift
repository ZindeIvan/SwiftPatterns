//
//  AppDetailVersionView.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/24/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionView : UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        label.text = "What's New"
        return label
    }()
    
    private(set) lazy var apiVersionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           
           setUI()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
       private func setUI() {
           self.addSubview(titleLabel)
           self.addSubview(apiVersionLabel)
           self.addSubview(releaseDateLabel)
           self.addSubview(releaseNotesLabel)
           
           NSLayoutConstraint.activate([
                
                titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
                titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
                titleLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -16.0),
                
                apiVersionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
                apiVersionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
                apiVersionLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: -5.0),
                
                releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
                releaseDateLabel.leftAnchor.constraint(greaterThanOrEqualTo: apiVersionLabel.rightAnchor, constant: 100.0),
                releaseDateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12.0),
                
                releaseNotesLabel.topAnchor.constraint(equalTo: apiVersionLabel.bottomAnchor, constant: 10.0),
                releaseNotesLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
                releaseNotesLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12.0),
                releaseNotesLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
                
           ])
           
       }
    
}
