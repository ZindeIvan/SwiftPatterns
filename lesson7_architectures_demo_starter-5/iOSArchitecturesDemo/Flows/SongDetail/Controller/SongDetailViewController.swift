//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/26/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {
    
    public var song: ITunesSong
    
    private let imageDownloader = ImageDownloader()
    
    var viewModel: SongDetailViewModel?
    
    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SongDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        viewModel = SongDetailViewModel(progress: 0, onProgressViewChanged: { [weak self] (progress) in
            guard let self = self else { return }
            
            self.songDetailView.progressBar.setProgress(Float(progress), animated: true)
        })
    }
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        self.songDetailView.configure(with: self.song)
        self.songDetailView.playButton.addTarget(self, action: #selector(playButtonDidTap), for: .touchUpInside)
        self.songDetailView.pauseButton.addTarget(self, action: #selector(pauseButtonDidTap), for: .touchUpInside)
        self.songDetailView.stopButton.addTarget(self, action: #selector(stopButtonDidTap), for: .touchUpInside)
    }
    
    @objc func playButtonDidTap(sender: UIButton!) {
        viewModel?.play()
    }
    
    @objc func pauseButtonDidTap(sender: UIButton!) {
        viewModel?.pause()
    }
    
    @objc func stopButtonDidTap(sender: UIButton!) {
        viewModel?.stop()
    }
    
}

