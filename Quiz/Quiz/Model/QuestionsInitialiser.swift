//
//  QuestionsInitialiser.swift
//  Quiz
//
//  Created by Зинде Иван on 10/30/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

//Класс наполнения вопросов викторины
class QuestionsInitialiser {
    
    //Тимы вопросов
    enum QuestionsTopic {
        case Comics
    }
    
    func initializeQuestions (topic : QuestionsTopic) -> [Question]{
        
        var questions : [Question] = []
        
        switch topic {
        case .Comics:
            questions.append(Question(questionText: "Как зовут Халка, когда он в человеческом обличии?",
                                    answers: ["Эрик Бана", "Брюс Беннер", "Гарри Осборн", "Брюс Уэйн"],
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
            
            questions.append(Question(questionText: "Актер,сыгравший двух разных персонажей в киновселенной Marvel:",
                                      answers: ["Себастьян Стэн", "Крис Хэмсворт", "Район Рейнольдс", "Крис Эванс"],
                                      rightAnswer: 3,
                                      callFriendPrompt: "Я знаю точно это - Крис Эванс",
                                      audienceHelp: [15,15,10,60]))
            
            questions.append(Question(questionText: "Родина Чёрной пантеры, это вымышленная страна ...:",
                                      answers: ["Транзия", "Мадрипур", "Ваканда", "Дженоша"],
                                      rightAnswer: 2,
                                      callFriendPrompt: "Вроде бы это Ваканда",
                                      audienceHelp: [30,8,55,7]))
            
            questions.append(Question(questionText: "Кто из персонажей носил маску Бэтгёрл?",
                                      answers: ["Дик Грейсон", "Барбара Гордон", "Лоис Лейн", "Талия аль Гул"],
                                      rightAnswer: 1,
                                      callFriendPrompt: "Я думаю это Барбара Гордон",
                                      audienceHelp: [3,56,11,30]))
            
            questions.append(Question(questionText: "Руководителем какой организации был Красный Череп в фильме Первый мститель?",
                                      answers: ["Аннербе", "Г.И.Д.Р.А", "Щ.И.Т", "М.Е.Ч."],
                                      rightAnswer: 1,
                                      callFriendPrompt: "Не уверен, но кажется это Г.И.Д.Р.А",
                                      audienceHelp: [20,55,25,5]))
            
            questions.append(Question(questionText: "Как называется лассо Чудо-Женщины?",
                                      answers: ["Лассо правды", "Чудо лассо", "Золотой кнут", "Просто ... лассо"],
                                      rightAnswer: 0,
                                      callFriendPrompt: "Вроде бы Лассо правды",
                                      audienceHelp: [50,20,25,5]))
            
            questions.append(Question(questionText: "Назовите имя пса Супермена?",
                                      answers: ["Супер-пес", "Крипто", "Летающий пушистик", "Дог Эл"],
                                      rightAnswer: 1,
                                      callFriendPrompt: "Вроде бы Крипто",
                                      audienceHelp: [25,50,15,10]))
            
            questions.append(Question(questionText: "Что означает на криптонианском логотип Супермена?",
                                      answers: ["Надежда", "Вера", "Любовь", "Сила"],
                                      rightAnswer: 0,
                                      callFriendPrompt: "Вроде бы это переводится как Надежда",
                                      audienceHelp: [50,20,25,5]))
            
            questions.append(Question(questionText: "Как звали девушку Дэдпула из одноименного фильма?",
                                      answers: ["Морена", "Виктория", "Ванесса", "Моника"],
                                      rightAnswer: 2,
                                      callFriendPrompt: "Уверен на 100% это Ванессе",
                                      audienceHelp: [20,20,55,5]))
            
            questions.append(Question(questionText: "Как называют кинематографическую вселенную Marvel?",
                                      answers: ["Земля №616", "Земля №1610", "Земля №1", "Земля №199999"],
                                      rightAnswer: 3,
                                      callFriendPrompt: "Вроде бы это Земля №199999",
                                      audienceHelp: [20,15,10,55]))
            
            questions.append(Question(questionText: "Какой суперзлодей не является членом Отряда Самоубийц",
                                      answers: ["Джокер", "Дедшот", "Харли Квин", "Рик Флаг"],
                                      rightAnswer: 0,
                                      callFriendPrompt: "Кажетося это Джокер",
                                      audienceHelp: [50,20,25,5]))
            

        }
        
        return questions
    }
}
