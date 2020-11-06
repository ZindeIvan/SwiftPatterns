//
//  UserQuestionsCaretaker.swift
//  Quiz
//
//  Created by Зинде Иван on 11/6/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Класс сохранения и восстановления пользовательских вопросов
final class UserQuestionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    //Ключ сохранения в UserDefaults
    private let key = "userQuestions"
    private let topic : QuestionsTopic
    
    init (topic : QuestionsTopic){
        self.topic = topic
    }
    
    //Метод сохранения
    func save(questions: [Question]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key + topic.rawValue)
        } catch {
            print(error)
        }
    }
    //Метод восстановления записей
    func retrieveRecords() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key + topic.rawValue) else {
            return []
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
