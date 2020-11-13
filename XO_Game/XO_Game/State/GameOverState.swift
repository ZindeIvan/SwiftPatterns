//
//  GameOverState.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

class GameOverState: GameState {
    var isMoveCompleted = false
    
    public let winner: Player?
    
    private weak var gameViewController: GameViewController?
    
    init(winner: Player?, gameViewController: GameViewController) {
        self.winner = winner
        self.gameViewController = gameViewController
    }
    
    func begin() {
        Log(action: .gameFinisehd(winner: winner))
        
        gameViewController?.winnerLabel.isHidden = false
        
        if let winner = winner {
            gameViewController?.winnerLabel.text = getWinnerName(from: winner) + " won"
        } else {
            gameViewController?.winnerLabel.text = "No winner"
        }
        
        gameViewController?.firstPlayerTurnLabel.isHidden = true
        gameViewController?.secondPlayerTurnLabel.isHidden = true
        gameViewController?.yourTurnLabel.isHidden = true
    }
    
    func addMark(at position: GameboardPosition) { }
    
    
    func getWinnerName(from: Player) -> String {
        if gameViewController?.gameType == GameType.versusPlayer {
            switch winner {
            case .first:
                return "1st player"
            case .second:
                return "2nd player"
            case .none:
                return "there is no winner"
            }
        } else {
            switch winner {
            case .first:
                return "Player"
            case .second:
                return "A.I."
            case .none:
                return "there is no winner"
            }
        }
    }
    
}
