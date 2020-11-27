//
//  SongDetailViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/27/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

protocol SongDetailViewModelInput {
    func play()
    func pause()
    func stop()
}

protocol SongDetailViewModelOutput {
    var onProgressViewChanged: ((Double) -> Void)? { get set }
}

class SongDetailViewModel: SongDetailViewModelOutput  {
    var onProgressViewChanged: ((Double) -> Void)?
    
    var timer: Timer?
    var progress: Double {
        didSet {
            onProgressViewChanged?(progress)
        }
    }
    
    init(progress: Double, onProgressViewChanged: ((Double) -> Void)?) {
        self.progress = progress
        self.onProgressViewChanged = onProgressViewChanged
        onProgressViewChanged?(progress)
    }
    
}

extension SongDetailViewModel: SongDetailViewModelInput {
    
    func play() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] (timer) in
            guard let self = self else { return }
            
            let newProgress = self.progress + 0.01
            if self.progress == 1 {
                timer.invalidate()
            }
            self.progress = min(newProgress, 1)
        }
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    func stop() {
        timer?.invalidate()
        progress = 0
    }
    
    
}
