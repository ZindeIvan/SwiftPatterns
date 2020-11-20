//
//  FriendsPhotoCollectionViewController.swift
//  VK_client
//
//  Created by Зинде Иван on 7/9/20.
//  Copyright © 2020 zindeivan. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

//Класс для отображения коллекции фото друзей пользователя
class FriendsPhotoCollectionViewController : UICollectionViewController{
    //Свойство идентификатора друга пользователя
    var friendID : Int?

    //Свойство количество фото для отображения
    private var photoCount : Int = 3
    
    //Свойство содержит ссылку на класс работы с Realm
    private let realmService = RealmService.shared
    //Свойство - токен для наблюдения за изменениями данных в Realm
    private var photosNotificationToken: NotificationToken?
    //Свойство - Адаптер для конфигурирования списка фото
    private let photoAdapter = PhotoAdapter()
    //Свойство список фотографий
    private var photos : [PhotoStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Вызовем загрузку фото из сети
        loadPhotosFromNetwork()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Вернем количество фото
        return photos.count
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCell", for: indexPath) as! FriendsPhotoCell
        //Установим фото друга в ячейке
        cell.friendPhotoImageView.sd_setImage(with: URL(string: photos[indexPath.row].photoSizeX), placeholderImage: UIImage(named: "error"))
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //Проверим идентификатор перехода
        if segue.identifier == "PhotoSegue" {
            //Если переход предназначен для открытия коллекции фото друга
            if let destination = segue.destination as? PhotoViewController {
                guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
                destination.setPhotoInformation(friendID: friendID, friendPhotoCount: photos.count, friendPhotoID: indexPath.row, photos: photos.map { $0.photoSizeX } )
            }
        }
    }
    
}

//Расширение для работы с сетью
extension FriendsPhotoCollectionViewController {
    //Метод загрузки фото из сети
    private func loadPhotosFromNetwork(){
        
        photoAdapter.getPhotos(ownerID: friendID ?? 0, albumID: .profile, photoCount: photoCount) { [weak self] (photos) in
            guard let self = self else { return }
            self.photos = photos
            self.collectionView.reloadData()
        }
    }
    
}

//Методы работы с оповещениями Realm
extension FriendsPhotoCollectionViewController {

    //Метод вызова оповещений об ошибках
    private func showAlert(title: String? = nil,
                   message: String? = nil,
                   handler: ((UIAlertAction) -> ())? = nil,
                   completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: completion)
    }
}


