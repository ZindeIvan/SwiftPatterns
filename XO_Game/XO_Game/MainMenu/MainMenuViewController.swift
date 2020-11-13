//
//  MainMenuViewController.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit
//Класс контроллер главного меню игры
class MainMenuViewController : UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destanation = segue.destination as? GameViewController else {return}
        switch segue.identifier {
        case "AISegue" :
            destanation.gameType = .versusAI
        case "twoPlayersSegue" :
            destanation.gameType = .versusPlayer
        case "StackMoves" :
            destanation.gameType = .stackMoves
        default :
            break
        }
    }
}
