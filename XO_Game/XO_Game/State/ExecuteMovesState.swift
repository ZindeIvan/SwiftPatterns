//
//  ExecuteMovesState.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/13/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Класс состояния выполнения ходов игры пошагово
class ExecuteMovesState : GameState {
    
    var isMoveCompleted: Bool = false
    
    private var moveInvoker : MoveInvoker?
    private weak var gameViewController: GameViewController?
    
    init(gameViewController: GameViewController,
         moveInvoker : MoveInvoker){
        self.moveInvoker = moveInvoker
        self.gameViewController = gameViewController
    }
    
    func begin() {

        gameViewController?.yourTurnLabel.isHidden = true
        gameViewController?.winnerLabel.isHidden = true
        gameViewController?.firstPlayerTurnLabel.isHidden = true
        gameViewController?.secondPlayerTurnLabel.isHidden = true
        moveInvoker?.execute()
        gameViewController?.setNextState()
    }
    
    func addMark(at position: GameboardPosition) { }
}
