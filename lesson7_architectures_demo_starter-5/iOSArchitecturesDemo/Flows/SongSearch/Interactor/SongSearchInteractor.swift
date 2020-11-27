//
//  SongSearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/26/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Alamofire

protocol SongSearchInteractorInput {
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

class SongSearchInteractor  : SongSearchInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        searchService.getSongs(forQuery: query, completion: completion)
    }
    
}
