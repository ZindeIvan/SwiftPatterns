//
//  GameState.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

protocol GameState {

    var isMoveCompleted: Bool { get }
    
    func begin()
    func addMark(at position: GameboardPosition)
    
}
