//
//  GameSessionsCaretaker.swift
//  Quiz
//
//  Created by Зинде Иван on 11/3/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

//Класс сохранения и восстановления списка игр
final class GameSessionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    //Ключ сохранения в UserDefaults
    private let key = "gameSessions"
    //Метод сохранения
    func save(gameSessions: [GameSession]) {
        do {
            let data = try self.encoder.encode(gameSessions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    //Метод восстановления записей
    func retrieveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
