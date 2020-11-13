//
//  GameType.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/13/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Перечисление типов игры
public enum GameType {
    //Против компьютера
    case versusAI
    //Против игрока
    case versusPlayer
    //С накоплением ходов
    case stackMoves
}
