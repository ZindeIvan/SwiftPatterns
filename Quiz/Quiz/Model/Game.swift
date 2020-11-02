//
//  Game.swift
//  Quiz
//
//  Created by Зинде Иван on 11/2/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

//Синглтон класс менеджера игры
class Game {
    //Вход в синглтон
    static let shared = Game()
    //Массив всех игр
    private(set) var gameSessions : [GameSession] {
        didSet {
            gameSessionsCaretaker.save(gameSessions: self.gameSessions)
        }
    }
    //Текущая игра
    private var gameSession : GameSession?
    //Объект сохранения и восстановления списка игр
    private let gameSessionsCaretaker = GameSessionsCaretaker()
    
    private init() {
        self.gameSessions = self.gameSessionsCaretaker.retrieveRecords()
    }
    //Метод начала игры
    func startGame (){
        self.gameSession = GameSession(date: Date())
    }
    //Метод завершения игры и подсчета итоговых данных
    func finishGameSession(lose: Bool, score: String, totalQuestionsCount: Int, correctAnswersCount: Int) {
        guard let game = gameSession else { return }
        game.lose = lose
        game.score = score
        if totalQuestionsCount != 0 {
            game.correctAnswersPercent = Float(correctAnswersCount) / Float(totalQuestionsCount) * 100
        }
        game.questionsTotalCount = totalQuestionsCount
        game.questionAnswerd = correctAnswersCount
        self.gameSessions.append(game)
    }
    //Метод использования подсказки 50/50
    func useFiftyFifty(){
        guard let game = gameSession else { return }
        game.fiftyFiftyUsed = true
    }
    //Метод использования подсказки звонок другу
    func useFriendCall(){
        guard let game = gameSession else { return }
        game.friendCallUsed = true
    }
    //Метод использования подсказки помощь зала
    func useAudienceHelp(){
        guard let game = gameSession else { return }
        game.audienceHelpUsed = true
    }
    //Метод очистки таблицы результатов
    func clearGameSessions() {
        self.gameSessions = []
    }
    
}
