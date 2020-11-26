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
//    func openAppInItunes(app: ITunesSong)
}

class SongSearchRouter: SongSearchRouterInput {
    weak var viewController: UIViewController?
    
    func openSong(for song: ITunesSong) {
//        let appDetailViewController = AppDetailViewController(app: app)
//        viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
}
