//
//  LogCommand.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

class LogCommand {
    
    let action: LogAction
    
    init(action: LogAction) {
        self.action = action
    }
    
    var logMessage: String {
        switch action {
        case .playerSetMark(let player, let position):
            return "\(player) placed mark at \(position)"
        case .gameFinisehd(let winner):
            if let winner = winner {
                return "\(winner) won game"
            } else {
                return "Is draw"
            }
        case .restartGame:
            return "Game restarted"
        }
    }
    
}
