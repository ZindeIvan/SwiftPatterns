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
        let interactor = SongSearchInteractor()
        let router = SongSearchRouter()
        let presenter = SongSearchPresenter(interactor: interactor, router: router)
        let viewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        
        return viewController
    }
    
}
