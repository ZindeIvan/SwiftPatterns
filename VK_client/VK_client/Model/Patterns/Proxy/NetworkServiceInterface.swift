//
//  NetworkServiceInterface.swift
//  VK_client
//
//  Created by Зинде Иван on 11/20/20.
//  Copyright © 2020 zindeivan. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceInterface {
    
    func loadFriends(token: String, completion: ((Swift.Result<[User], Error>) -> Void)?)
    func loadGroups(token: String, completion: ((Swift.Result<[Group], Error>) -> Void)?)
    func groupsSearch(token: String, searchQuery : String?, completion: ((Swift.Result<[Group], Error>) -> Void)?)
    func loadPhotos(token: String, ownerID : Int, albumID : AlbumID, photoCount : Int,completion: ((Swift.Result<[Photo], Error>) -> Void)?)
    func loadNews(startFrom : String, token: String, filter : NewsfeedFilters, newsCount : Int, completion: ((Swift.Result<[News], Error>) -> Void)?)
}
