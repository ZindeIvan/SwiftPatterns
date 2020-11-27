//
//  SongSearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/26/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchRouterInput {
    func openSong(for song: ITunesSong)
}

class SongSearchRouter: SongSearchRouterInput {
    weak var viewController: UIViewController?
    
    func openSong(for song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
    
}
