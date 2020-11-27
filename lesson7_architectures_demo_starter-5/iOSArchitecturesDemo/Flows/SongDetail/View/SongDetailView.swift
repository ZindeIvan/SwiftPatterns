//
//  SongDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/26/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailView: UIView {
    
    // MARK: - Subviews
    
    let throbber = UIActivityIndicatorView(style: .gray)
    
    private(set) lazy var artworkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30.0)
        return label
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25.0)
        return label
    }()
    
    private(set) lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 22.0)
        return label
    }()
    
    private(set) lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.tintColor = .varna
        
        return progressBar
    }()
    
    private(set) lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.varna, for: .highlighted)
        button.backgroundColor = .varna
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private(set) lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pause", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.varna, for: .highlighted)
        button.backgroundColor = .varna
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private(set) lazy var stopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Stop", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.varna, for: .highlighted)
        button.backgroundColor = .varna
        button.layer.cornerRadius = 16.0
        button.layer.masksToBounds = true
        
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        
        self.addSubview(self.artworkImage)
        self.addSubview(self.trackLabel)
        self.addSubview(self.artistLabel)
        self.addSubview(self.collectionLabel)
        self.addSubview(self.progressBar)
        self.addSubview(self.playButton)
        self.addSubview(self.stopButton)
        self.addSubview(self.pauseButton)
               
        NSLayoutConstraint.activate([
            
            self.artworkImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 50.0),
            self.artworkImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.artworkImage.widthAnchor.constraint(equalToConstant: 200.0),
            self.artworkImage.heightAnchor.constraint(equalToConstant: 200.0),
            
            self.trackLabel.topAnchor.constraint(equalTo: self.artworkImage.bottomAnchor, constant: 10.0),
            self.trackLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12.0),
            self.trackLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40.0),
            
            self.artistLabel.topAnchor.constraint(equalTo: self.trackLabel.bottomAnchor, constant: 4.0),
            self.artistLabel.leftAnchor.constraint(equalTo: self.trackLabel.leftAnchor),
            self.artistLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40.0),
            
            self.collectionLabel.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 4.0),
            self.collectionLabel.leftAnchor.constraint(equalTo: self.trackLabel.leftAnchor),
            self.collectionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40.0),
            
            self.progressBar.topAnchor.constraint(equalTo: collectionLabel.bottomAnchor, constant: 10.0),
            self.progressBar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0),
            self.progressBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20.0),
            self.progressBar.heightAnchor.constraint(equalToConstant: 3.0),
            
            self.playButton.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 10.0),
            self.playButton.rightAnchor.constraint(equalTo: self.pauseButton.leftAnchor, constant: -20.0),
            self.playButton.widthAnchor.constraint(equalToConstant: 80.0),
            self.playButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            self.pauseButton.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 10.0),
            self.pauseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10.0),
            self.pauseButton.widthAnchor.constraint(equalToConstant: 80.0),
            self.pauseButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            self.stopButton.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 10.0),
            self.stopButton.leftAnchor.constraint(equalTo: self.pauseButton.rightAnchor, constant: 20.0),
            self.stopButton.widthAnchor.constraint(equalToConstant: 80.0),
            self.stopButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            ])
    }
    
    // MARK: - Configure
    
    func configure(with song: ITunesSong) {
        self.trackLabel.text = song.trackName
        self.artistLabel.text = song.artistName
        self.collectionLabel.text = song.collectionName
        self.progressBar.setProgress(0, animated: true)
        self.artworkImage.sd_setImage(with: URL(string: song.artwork ?? ""))
    }
}

