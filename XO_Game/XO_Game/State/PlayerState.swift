//
//  PlayerState.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

class PlayerState: GameState {
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
        if gameViewController?.gameType == GameType.versusPlayer {
            gameViewController?.yourTurnLabel.isHidden = true
            switch player {
            case .first:
                gameViewController?.firstPlayerTurnLabel.isHidden = false
                gameViewController?.secondPlayerTurnLabel.isHidden = true
            case .second:
                gameViewController?.firstPlayerTurnLabel.isHidden = true
                gameViewController?.secondPlayerTurnLabel.isHidden = false
            }
        } else {
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = true
            switch player {
            case .first:
                gameViewController?.yourTurnLabel.isHidden = false
            case .second:
                gameViewController?.yourTurnLabel.isHidden = true
            }
        }
        
        gameViewController?.winnerLabel.isHidden = true
    }
    
    func addMark(at position: GameboardPosition) {
        Log(action: .playerSetMark(player: player, position: position))
        
        guard let gameBoardView = gameBoardView, gameBoardView.canPlaceMarkView(at: position) else {
            return
        }
        gameBoard?.setPlayer(player, at: position)
        gameBoardView.placeMarkView(markViewPrototype.copy(), at: position)
        isMoveCompleted = true
    }
}
