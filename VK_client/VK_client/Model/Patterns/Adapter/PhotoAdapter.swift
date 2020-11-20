//
//  PhotoAdapter.swift
//  VK_client
//
//  Created by Зинде Иван on 11/9/20.
//  Copyright © 2020 zindeivan. All rights reserved.
//

import Foundation
import RealmSwift

//Класс Адаптер  - для получения данных из сети,
//  сохранения в Realm, и вывода данных в UI
final class PhotoAdapter {
    
    private var photosNotificationToken: NotificationToken?
    //Свойство содержит ссылку на класс работы с Realm
    private let realmService = RealmService.shared
    
    //Метод получения фото и сохранения данных в Realm
    func getPhotos(ownerID : Int, albumID : AlbumID, photoCount : Int, completion: @escaping ([PhotoStruct]) -> Void) {
        guard let _ = try? Realm(), let photos: Results<Photo> = realmService?.loadFromRealm().filter("ownerID == %i", ownerID) else { return }
        
             //Установим наблюдателя для событий с данными в БД
             photosNotificationToken = photos.observe { [weak self] change in
                 guard let self = self else { return }
                 switch change {
                 //Инициализация
                 case .initial:
                    break
                 //Изменение
                 case let .update(results, _, _, _):
                    var photosStructs: [PhotoStruct] = []
                    results.forEach { (Photo) in
                        photosStructs.append(self.getPhotoStruct(from: Photo))
                    }
                    completion(photosStructs)
                 case let .error(error):
                    print(error.localizedDescription)
                 }
    
             }
        let networkServiceProxy = NetworkServiceProxy(networkService: NetworkService.shared)
        networkServiceProxy.loadPhotos(token: Session.instance.token, ownerID: ownerID, albumID: albumID, photoCount: photoCount) { [weak self]  result in
            switch result {
            case let .success(photos):
                DispatchQueue.main.async {
                    try? self?.realmService?.saveInRealm(objects: photos)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    //Метод получения структуры для хранения данных о фото
    private func getPhotoStruct (from photo : Photo) -> PhotoStruct {
        return PhotoStruct(id: photo.id,
                           ownerID: photo.ownerID,
                           photoSizeX: photo.photoSizeX,
                           photoSizeM: photo.photoSizeM,
                           photoSizeS: photo.photoSizeS,
                           photoSizeXHeight: photo.photoSizeXHeight,
                           photoSizeXWidth: photo.photoSizeXWidth,
                           photoSizeMHeight: photo.photoSizeMHeight,
                           photoSizeMWidth: photo.photoSizeMWidth,
                           photoSizeSHeight: photo.photoSizeSHeight,
                           photoSizeSWidth: photo.photoSizeSWidth)
    }
    
}
