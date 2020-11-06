//
//  QuestionsOrderStrategy.swift
//  Quiz
//
//  Created by Зинде Иван on 11/5/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

//Перечисление порядка вопросов
enum QuestionsOrder {
    case ordered, random
}

//Протокол стратегии порядка вопросов
protocol QuestionsOrderStrategy {
    func getNextQuestion(questions : [Question]) -> [Question]
}

//Стратегия вопросов в прямом порядке
class OrderedQuestionsStrategy : QuestionsOrderStrategy {
    func getNextQuestion(questions: [Question]) -> [Question] {
        questions
    }
}

//Стратегия вопросов в случайном порядке
class RandomQuestionsStrategy : QuestionsOrderStrategy {
    func getNextQuestion(questions: [Question]) -> [Question] {
        questions.shuffled()
    }
}
