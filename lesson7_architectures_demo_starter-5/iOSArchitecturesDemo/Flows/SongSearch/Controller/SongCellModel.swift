//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/24/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let trackName: String
    let artistName: String?
    let collectionName: String?
    let artwork: String?

}

final class SongCellModelFactory {
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(trackName: model.trackName,
                             artistName: model.artistName,
                             collectionName: model.collectionName,
                             artwork : model.artwork)
    }
}

