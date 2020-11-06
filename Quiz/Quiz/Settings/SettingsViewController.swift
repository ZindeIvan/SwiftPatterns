//
//  SettingsViewController.swift
//  Quiz
//
//  Created by Зинде Иван on 11/5/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit
//Класс контроллер экрана настроек
class SettingsViewController : UIViewController{
    
    @IBOutlet private weak var questionsOrderSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var questionsTopicSegmentedControl: UISegmentedControl!
    //Менеджер игры
    private let gameManager = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @IBAction func questionsOrderSegmentedControlValueChanged(_ sender: Any) {
        
        gameManager.questionsOrder = getQuestionsOrderSegmentedControl()
    }
    
    @IBAction func questionsTopicSegmentedControlValueChanged(_ sender: Any) {
        
        gameManager.questionsTopic = getQuestionsTopicSegmentedControl()
    }
    //Метод получения порядка вопросов
    private func getQuestionsOrderSegmentedControl() -> QuestionsOrder{
        switch questionsOrderSegmentedControl.selectedSegmentIndex {
        case 0:
            return .ordered
        case 1:
            return .random
        default:
            return .ordered
        }
    }
    //Метод получения тем вопросов
    private func getQuestionsTopicSegmentedControl() -> QuestionsTopic{
        switch questionsTopicSegmentedControl.selectedSegmentIndex {
        case 0:
            return .Comics
        case 1:
            return .Science
        default:
            return .Comics
        }
    }
    
    //Метод конфигурирования элементов
    private func configureUI() {
        questionsTopicSegmentedControl.removeAllSegments()
        questionsTopicSegmentedControl.insertSegment(withTitle: QuestionsTopic.Comics.rawValue, at: 0, animated: false)
        questionsTopicSegmentedControl.insertSegment(withTitle: QuestionsTopic.Science.rawValue, at: 1, animated: false)
        questionsTopicSegmentedControl.selectedSegmentIndex = 0
        
        switch gameManager.questionsTopic {
            
        case .Comics:
            questionsTopicSegmentedControl.selectedSegmentIndex = 0
        case .Science:
            questionsTopicSegmentedControl.selectedSegmentIndex = 1
        }
        
        switch gameManager.questionsOrder {
            
        case .ordered:
            questionsOrderSegmentedControl.selectedSegmentIndex = 0
        case .random:
            questionsOrderSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
}
