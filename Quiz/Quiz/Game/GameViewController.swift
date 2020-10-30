//
//  GameViewController.swift
//  Quiz
//
//  Created by Зинде Иван on 10/30/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    
    @IBOutlet private weak var firstAnswerButton: UIButton!
    @IBOutlet private weak var secondAnswerButton: UIButton!
    @IBOutlet private weak var thirdAnswerButton: UIButton!
    @IBOutlet private weak var fourthAnswerButton: UIButton!
    
    @IBOutlet private weak var fiftyFiftyButton: UIButton!
    @IBOutlet private weak var friendCallButton: UIButton!
    @IBOutlet private weak var audienceHelpButton: UIButton!
    
    private var questions : [Question] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuestions()
    }

    private func loadQuestions (){
        let initialiser = QuestionsInitialiser()
        questions = initialiser.initializeQuestions(topic: .Comics)
        
    }
    
    
//  MARK: Buttons
    
    @IBAction func firstAnswerPick(_ sender: Any) {
    }
    
    @IBAction func secondAnswerPick(_ sender: Any) {
    }
    
    @IBAction func thirdAnswerPick(_ sender: Any) {
    }
    
    @IBAction func fourthAnswerPick(_ sender: Any) {
    }
    
    @IBAction func fiftyFiftyPick(_ sender: Any) {
    }
    
    @IBAction func friendCallPick(_ sender: Any) {
    }
    
    @IBAction func audienceHelpPick(_ sender: Any) {
    }
    
    @IBAction func endGame(_ sender: Any) {
    }
    
    
}
