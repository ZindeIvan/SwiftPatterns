//
//  MainMenuViewController.swift
//  Quiz
//
//  Created by Зинде Иван on 10/30/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
import UIKit

//Класс контроллер экрана меню игры
class MainMenuViewController: UIViewController{
    //Синглтон игры
    private let gameManager = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch  segue.identifier {
        //Если переходим на экран игры - делегируем текущий экран для экрана игры
        case "StartGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            
            gameManager.startGame()
            destination.deligate = self
            destination.onFiftyFiftyUse = { [weak self]  in
                self?.gameManager.useFiftyFifty()
            }
            destination.onFriendCallUse = { [weak self]  in
                self?.gameManager.useFriendCall()
            }
            destination.onAudienceHelpUse = { [weak self]  in
                self?.gameManager.useAudienceHelp()
            }
                
        default:
            break
        }
    }
}

//Расширения делегат для окончания игры
extension MainMenuViewController  :  GameViewControllerDelegate  {
    
    func didEndGame(lose: Bool, score: String, totalAnswersCount: Int, correctAnswersCount: Int) {
        self.gameManager.finishGameSession(lose: lose,
                                           score: score,
                                           totalQuestionsCount: totalAnswersCount,
                                           correctAnswersCount: correctAnswersCount)
        
    }
    
}
