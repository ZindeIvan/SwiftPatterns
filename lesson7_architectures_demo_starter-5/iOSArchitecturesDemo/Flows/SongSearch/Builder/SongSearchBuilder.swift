//
//  SongSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/24/20.
//  Copyright © 2020 ekireev. All rights reserved.
//


import UIKit

class SongSearchBuilder {
    
    static func build() -> (UIViewController & SongSearchViewInput) {
        let presenter = SongSearchPresenter()
        let viewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        
        return viewController
    }
    
}
