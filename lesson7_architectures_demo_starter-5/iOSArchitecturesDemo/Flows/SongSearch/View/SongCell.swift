//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/24/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit
import SDWebImage

final class SongCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var artworkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.trackLabel.text = cellModel.trackName
        self.artistLabel.text = cellModel.artistName
        self.collectionLabel.text = cellModel.collectionName
        self.artworkImage.sd_setImage(with: URL(string: cellModel.artwork ?? ""))
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.trackLabel, self.artistLabel, self.collectionLabel].forEach { $0.text = nil }
        self.artworkImage.image = UIImage()
    }
    
    private func configureUI() {

        self.contentView.addSubview(self.artworkImage)
        self.contentView.addSubview(self.trackLabel)
        self.contentView.addSubview(self.artistLabel)
        self.contentView.addSubview(self.collectionLabel)
        
        NSLayoutConstraint.activate([
        
        self.artworkImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0),
        self.artworkImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
        self.artworkImage.widthAnchor.constraint(equalToConstant: 60.0),
        self.artworkImage.heightAnchor.constraint(equalToConstant: 60.0),
        
        self.trackLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
        self.trackLabel.leftAnchor.constraint(equalTo: self.artworkImage.rightAnchor, constant: 12.0),
        self.trackLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0),
        
        self.artistLabel.topAnchor.constraint(equalTo: self.trackLabel.bottomAnchor, constant: 4.0),
        self.artistLabel.leftAnchor.constraint(equalTo: self.trackLabel.leftAnchor),
        self.artistLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0),
        
        self.collectionLabel.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 4.0),
        self.collectionLabel.leftAnchor.constraint(equalTo: self.trackLabel.leftAnchor),
        self.collectionLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            
        ])
    }

}
