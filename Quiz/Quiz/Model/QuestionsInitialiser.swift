//
//  QuestionsInitialiser.swift
//  Quiz
//
//  Created by Зинде Иван on 10/30/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

class QuestionsInitialiser {
    
    enum QuestionsTopic {
        case Comics
    }
    
    func initializeQuestions (topic : QuestionsTopic) -> [Question]{
        
        var questions : [Question] = []
        
        switch topic {
        case .Comics:
            questions.append(Question(questionText: "Как зовут Халка, когда он в человеческом обличии?",
                                    answers: ["Эрик Бан", "Брюс Беннер", "Гарри Осборн", "Брюс Уэйн"],
                                    rightAnswer: 1,
                                    callFriendPrompt: "Я помню что Брюс... Кажется Брюс Беннер",
                                    audienceHelp: [5,65,10,20]))
            
            questions.append(Question(questionText: "Кто из героев не является основателем Мстителей?",
                                    answers: ["Железный человек", "Тор", "Черная Пантера", "Халк"],
                                    rightAnswer: 2,
                                    callFriendPrompt: "Хмм... Думаю что это Черная Пантера",
                                    audienceHelp: [3,7,55,35]))
            
            questions.append(Question(questionText: "Герой комиксов DC не обладающий суперсилами?",
                                    answers: ["Бетмен", "Марсианский Охотник", "Флеш", "Шазам"],
                                    rightAnswer: 0,
                                    callFriendPrompt: "Не уверен на все 100% но кажется что Бетмен",
                                    audienceHelp: [40,35,8,17]))
            
            questions.append(Question(questionText: "Как Боги Асгарда называют землю?",
                                    answers: ["Вальхалла", "Нифльхейм", "Нидавеллир", "Мидгард"],
                                    rightAnswer: 3,
                                    callFriendPrompt: "Извини не помню точно - возможно это Мидгард",
                                    audienceHelp: [2,8,35,55]))
            
            questions.append(Question(questionText: "Супергерл была:",
                                    answers: ["Кузиной Супермена", "Сестрой Супермена", "Дочерью Супермена", "Подругой Супермена"],
                                    rightAnswer: 0,
                                    callFriendPrompt: "Вроде бы она была его кузиной",
                                    audienceHelp: [50,20,25,5]))
            

        }
        
        return questions
    }
}
