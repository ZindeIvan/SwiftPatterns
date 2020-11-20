//
//  NetworkServiceProxy.swift
//  VK_client
//
//  Created by Зинде Иван on 11/20/20.
//  Copyright © 2020 zindeivan. All rights reserved.
//

import Foundation
//Класс прокси для логирования сетевых запросов
class NetworkServiceProxy : NetworkServiceInterface {
    
    var networkService : NetworkServiceInterface
    
    init(networkService : NetworkServiceInterface) {
        self.networkService = networkService
    }
    
    func loadFriends(token: String, completion: ((Result<[User], Error>) -> Void)?) {
        networkService.loadFriends(token: token, completion: completion)
        print("Loading friends list from server")
        
    }
    
    func loadGroups(token: String, completion: ((Result<[Group], Error>) -> Void)?) {
        networkService.loadGroups(token: token, completion: completion)
        print("Loading groups list from server")
    }
    
    func groupsSearch(token: String, searchQuery: String?, completion: ((Result<[Group], Error>) -> Void)?) {
        networkService.groupsSearch(token: token, searchQuery: searchQuery, completion: completion)
        print("Searching groups whith search query" + (searchQuery ?? "")+" on server")
    }
    
    func loadPhotos(token: String, ownerID: Int, albumID: AlbumID, photoCount: Int, completion: ((Result<[Photo], Error>) -> Void)?) {
        networkService.loadPhotos(token: token, ownerID: ownerID, albumID: albumID, photoCount: photoCount, completion: completion)
        print("Loading photos whith owner ID: \(ownerID) from server, photo count \(photoCount)")
    }
    
    func loadNews(startFrom: String, token: String, filter: NewsfeedFilters, newsCount: Int, completion: ((Result<[News], Error>) -> Void)?) {
        networkService.loadNews(startFrom: startFrom, token: token, filter: filter, newsCount: newsCount, completion: completion)
        print("Loading news feed from server, news count \(newsCount)")
    }
}

