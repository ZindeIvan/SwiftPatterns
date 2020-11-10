//
//  NewsViewModel.swift
//  VK_client
//
//  Created by Зинде Иван on 11/10/20.
//  Copyright © 2020 zindeivan. All rights reserved.
//

import Foundation

//Структура для хранения данных новости для отображения в UI
struct NewsViewModel {
    var newsOwner :  String
    var newsText :  String?
    var newsDate :  String
    var watchedCount :  String
    var likeCountString :  String
    var commentCount :  String
    var shareCount  :  String
    var photoWidth  :  Double
    var photoHeight :  Double
    var photoURL : URL?
    var newsIconURL : URL?
    var likeCount :  Int
}
