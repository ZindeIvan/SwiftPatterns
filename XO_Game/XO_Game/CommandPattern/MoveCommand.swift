//
//  MoveCommand.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/13/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Класс Command для паттерна Command для типа игры с накоплением ходо
class MoveCommand {
    
    let player : Player
    let position : GameboardPosition
    let markView : MarkView
    
    init(player: Player, position: GameboardPosition, markView : MarkView){
        self.player = player
        self.position = position
        self.markView = markView
    }
    
}
