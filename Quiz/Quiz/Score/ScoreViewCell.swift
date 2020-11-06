//
//  ScoreViewCell.swift
//  Quiz
//
//  Created by Зинде Иван on 11/2/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit
//Класс ячейки таблицы счета
class ScoreViewCell : UITableViewCell {
    
    @IBOutlet private weak var dateLabel : UILabel!
    @IBOutlet private weak var scoreLabel : UILabel!
    @IBOutlet private weak var answersLabel : UILabel!
    @IBOutlet private weak var loseLabel : UILabel!
    @IBOutlet private weak var fiftyFiftyImageView : UIImageView!
    @IBOutlet private weak var friendCallImageView : UIImageView!
    @IBOutlet private weak var audienceHelpImageView : UIImageView!
    
    //Метод конфигурирования ячейки
    func configureCell(gameSession: GameSession){
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        dateLabel.text = formatter.string(from: gameSession.date)
        
        scoreLabel.text = gameSession.score
        answersLabel.text = "Ответы: \(gameSession.questionAnswerd)/\(gameSession.questionsTotalCount) \(String(format: "%.2f", gameSession.correctAnswersPercent))%"
        if gameSession.lose {
            loseLabel.textColor = .red
            loseLabel.text = "Поражение"
        } else {
            loseLabel.textColor = .green
            loseLabel.text = "Победа"
        }
        
        fiftyFiftyImageView.isHidden = gameSession.fiftyFiftyUsed
        friendCallImageView.isHidden = gameSession.friendCallUsed
        audienceHelpImageView.isHidden = gameSession.audienceHelpUsed
        
    }
}
