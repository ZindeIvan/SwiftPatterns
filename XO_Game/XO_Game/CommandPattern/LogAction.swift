//
//  LogAction.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

public enum LogAction {
    case playerSetMark(player: Player, position: GameboardPosition)
    case gameFinisehd(winner: Player?)
    case restartGame
}
