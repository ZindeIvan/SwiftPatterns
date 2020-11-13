//
//  StackMovesState.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/13/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Класс состояние игры накопления ходов пошагово
class StackMovesState : GameState {
    
    var isMoveCompleted: Bool = false
    
    public let player: Player
    private weak var gameViewController: GameViewController?
    private var moveInvoker : MoveInvoker?
    
    public let markViewPrototype: MarkView
    
    init(player: Player, gameViewController: GameViewController, markViewPrototype: MarkView, moveInvoker : MoveInvoker) {
        self.player = player
        self.gameViewController = gameViewController
        self.markViewPrototype = markViewPrototype
        self.moveInvoker = moveInvoker
    }
    
    func begin() {
        switch player {
        case .first:
            gameViewController?.firstPlayerTurnLabel.isHidden = false
            gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        gameViewController?.yourTurnLabel.isHidden = true
        gameViewController?.winnerLabel.isHidden = true
    }
    
    func addMark(at position: GameboardPosition) {
        moveInvoker?.addLogCommand(command: MoveCommand(player: player, position: position, markView: markViewPrototype.copy()))
        isMoveCompleted = true
    }
    
}
