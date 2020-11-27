//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/24/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit
import Alamofire

protocol SongSearchViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SongSearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ song: ITunesSong)
}

class SongSearchPresenter {
    private let searchService = ITunesSearchService()
    let interactor: SongSearchInteractorInput
    let router: SongSearchRouterInput
    
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    
    init(interactor: SongSearchInteractorInput, router: SongSearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
}

extension SongSearchPresenter: SongSearchViewOutput {

    func viewDidSearch(with query: String) {
        interactor.requestSongs(with: query) { [weak self] (result) in
            guard let self = self else { return }
            
            self.viewInput?.throbber(show: false)
            result.withValue { (songs) in
                guard !songs.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            }.withError { (error) in
                self.viewInput?.showError(error: error)
            }
        }
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        router.openSong(for: song)
    }
    
}

