//
//  GameSession.swift
//  Quiz
//
//  Created by Зинде Иван on 11/2/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

//Класс игровой сессии
class GameSession : Codable{
    //Использована подсказка 50/50
    var fiftyFiftyUsed : Bool = false
    //Использована подсказка звонок другу
    var friendCallUsed : Bool = false
    //Использована подсказка помощь зала
    var audienceHelpUsed : Bool = false
    //Количество верных ответов
    var questionAnswerd : Int = 0
    //Количество вопросов всего
    var questionsTotalCount : Int = 0
    //Финальный счет
    var score : String = ""
    //Флаг проигрыша (если игрок берет деньги до последнего вопроса - засчитывается за поражение)
    var lose : Bool = false
    //Процентное соотношение верных ответов
    var correctAnswersPercent : Float = 0
    //Дата игры
    var date: Date
    
    
    init(date : Date){
        self.date = date
    }
    
}
