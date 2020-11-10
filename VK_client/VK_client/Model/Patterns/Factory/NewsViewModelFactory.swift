//
//  NewsViewModelFabric.swift
//  VK_client
//
//  Created by Зинде Иван on 11/10/20.
//  Copyright © 2020 zindeivan. All rights reserved.
//

import Foundation

//Класс Фабрика для конфигурирования списка новостей
class NewsViewModelFactory {
    //Метод получения списка новостей на основании данных из сети
    func constructViewModel(from news: [News]) -> [NewsViewModel] {
        return news.compactMap(getViewModel)
    }
    //Метод для получения модели новости из данных из сети
    private func getViewModel(from news: News) -> NewsViewModel {
        
        let watchedCount = String(news.viewsCount)
        let likeCount = String(news.likesCount)
        let comentCount = String(news.commentsCount)
        let shareCount = String(news.repostsCount)
        let photoURL = URL(string: news.photoSizeX)
        let newsIconURL = URL(string: news.photo50)
        
        return NewsViewModel(newsOwner: news.owner,
                             newsText: news.text,
                             newsDate: news.date,
                             watchedCount: watchedCount,
                             likeCountString: likeCount,
                             commentCount: comentCount,
                             shareCount: shareCount,
                             photoWidth: news.photoSizeXWidth,
                             photoHeight: news.photoSizeXHeight,
                             photoURL: photoURL,
                             newsIconURL: newsIconURL,
                             likeCount: news.likesCount)
        
    }
}
