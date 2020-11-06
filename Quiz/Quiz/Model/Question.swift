//
//  Question.swift
//  Quiz
//
//  Created by Зинде Иван on 10/29/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

// Структура вопроса
struct Question : Codable {
    //Текст вопроса
    var questionText : String
    //Массив ответов
    var answers : [String]
    //Индекс верного ответа
    var rightAnswer : Int
    //Подсказка - Звонок другу
    var callFriendPrompt : String
    //Подсказка - Помощь зала
    var audienceHelp : [Float]
    
}
