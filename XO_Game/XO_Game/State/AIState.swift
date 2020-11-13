//
//  AIState.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/13/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Класс состояние игры - игра против компьютера
class AIState: GameState {
    var isMoveCompleted: Bool = false
    
    public let player: Player
    private weak var gameViewController: GameViewController?
    private weak var gameBoard: Gameboard?
    private weak var gameBoardView: GameboardView?
    
    public let markViewPrototype: MarkView
    
    init(player: Player, gameViewController: GameViewController,
         gameBoard: Gameboard, gameBoardView: GameboardView, markViewPrototype: MarkView) {
        self.player = player
        self.gameViewController = gameViewController
        self.gameBoard = gameBoard
        self.gameBoardView = gameBoardView
        self.markViewPrototype = markViewPrototype
    }
    
    func begin() {
        gameViewController?.firstPlayerTurnLabel.isHidden = true
        gameViewController?.secondPlayerTurnLabel.isHidden = true
        switch player {
        case .first:
            gameViewController?.yourTurnLabel.isHidden = false
        case .second:
            gameViewController?.yourTurnLabel.isHidden = true
        }
        
        addMark(at: getNextPosition())
    }
    
    func getNextPosition() -> GameboardPosition{
        
        guard let gameBoardView = gameBoardView else { return GameboardPosition.init(column: 1, row: 1)}
        
        while true {
            let column = Int.random(in: 0..<GameboardSize.columns)
            let row = Int.random(in: 0..<GameboardSize.rows)
            let position = GameboardPosition.init(column: column, row: row)
            if gameBoardView.canPlaceMarkView(at: position) {
                return position
            }
        }
    }
    
    func addMark(at position: GameboardPosition) {
        Log(action: .playerSetMark(player: player, position: position))
        
        guard let gameBoardView = gameBoardView else {
            return
        }
        gameBoard?.setPlayer(player, at: position)
        gameBoardView.placeMarkView(markViewPrototype.copy(), at: position)
        isMoveCompleted = true
        gameViewController?.counter += 1
        gameViewController?.setNextState()
    }
}
