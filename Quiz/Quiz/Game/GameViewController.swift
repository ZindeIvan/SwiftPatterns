//
//  GameViewController.swift
//  Quiz
//
//  Created by Зинде Иван on 10/30/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
import UIKit

//Класс контроллер экрана игры
class GameViewController: UIViewController {
    
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    
    @IBOutlet private weak var firstAnswerLabel: UILabel!
    @IBOutlet private weak var firstAnswerButton: UIButton!
    @IBOutlet private weak var secondAnswerLabel: UILabel!
    @IBOutlet private weak var secondAnswerButton: UIButton!
    @IBOutlet private weak var thirdAnswerLabel: UILabel!
    @IBOutlet private weak var thirdAnswerButton: UIButton!
    @IBOutlet private weak var fourthAnswerLabel: UILabel!
    @IBOutlet private weak var fourthAnswerButton: UIButton!
    
    @IBOutlet private weak var fiftyFiftyButton: UIButton!
    @IBOutlet private weak var friendCallButton: UIButton!
    @IBOutlet private weak var audienceHelpButton: UIButton!
    
    //Массив вопросов
    private var questions : [Question] = []
    //Номер текущего вопроса
    private var currentQuestionNumber = 0
    //Массив баллов за вопросы
    private var hightScore : [String] = []
    //Свойство индекатор - Использована ли подсказка 50/50
    private var fiftyFiftyUsed : Bool = false{
        didSet {
            fiftyFiftyButton.isEnabled = !fiftyFiftyUsed
        }
    }
    //Свойство индекатор - Использована ли подсказка звонок другу
    private var friendCallUsed : Bool = false{
        didSet {
            friendCallButton.isEnabled = !friendCallUsed
        }
    }
    //Свойство индекатор - Использована ли подсказка помощь зала
    private var audienceHelpUsed : Bool = false{
        didSet {
            audienceHelpButton.isEnabled = !audienceHelpUsed
        }
    }
    //Перечисление состояний завершения игры
    enum GameEndState {
        case lose, win, withdraw
    }
    //Замыкания событий подсказок для делегирования
    var onFiftyFiftyUse: (() -> Void)?
    var onFriendCallUse: (() -> Void)?
    var onAudienceHelpUse: (() -> Void)?
    //Делигат для события конца игры
    var deligate : GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hightScore = getHighScore()
        loadQuestions()
        prepareNextQuestion(currentQuestionNumber)
        setHighScore()
    }
    
    //Метод загрузки вопросов из инициализатора
    private func loadQuestions () {
        let initialiser = QuestionsInitialiser()
        questions = initialiser.initializeQuestions(topic: .Comics)
    }
    
    //Метод подготоки следующего вопроса
    private func prepareNextQuestion(_ questionNumber : Int) {
        guard questions.count >= questionNumber + 1 else { return }
        let question = questions[questionNumber]
        
        questionLabel.text = question.questionText
        firstAnswerButton.setTitle(question.answers[0], for: .normal)
        secondAnswerButton.setTitle(question.answers[1], for: .normal)
        thirdAnswerButton.setTitle(question.answers[2], for: .normal)
        fourthAnswerButton.setTitle(question.answers[3], for: .normal)
        
        resetButtonsVisibility()
    }
    
    //Метод обновения видимости лейблов кнопок ответов при использовании подсказки 50/50
    private func updateButtonsVisibility() {
        firstAnswerLabel.isHidden = firstAnswerButton.isHidden
        secondAnswerLabel.isHidden = secondAnswerButton.isHidden
        thirdAnswerLabel.isHidden = thirdAnswerButton.isHidden
        fourthAnswerLabel.isHidden = fourthAnswerButton.isHidden
    }
    
    //Метод обновения видимости кнопокв ответов
    //после использования подсказки 50/50 и переходе к следующему вопросу
    private func resetButtonsVisibility() {
       
        if firstAnswerButton.isHidden {
            firstAnswerButton.isHidden = false
            firstAnswerLabel.isHidden = false
        }
        if secondAnswerButton.isHidden {
            secondAnswerButton.isHidden = false
            secondAnswerLabel.isHidden = false
        }
        if thirdAnswerButton.isHidden {
            thirdAnswerButton.isHidden = false
            thirdAnswerLabel.isHidden = false
        }
        if fourthAnswerButton.isHidden {
            fourthAnswerButton.isHidden = false
            fourthAnswerLabel.isHidden = false
        }
    }
    
    //Метод проверки верного ответа
    private func checkRightAnswer(_ pickedAnswer : Int) {
        guard (0...3).contains(pickedAnswer) else {return}
        if pickedAnswer == questions[currentQuestionNumber].rightAnswer {
            if currentQuestionNumber == questions.count - 1 {
                showAlert(title: "Конец игры",
                          message: "Победа",
                          okHandler: ({ [weak self] action in
                            self?.endGame(.win)
                          }))
            }
            else {
                currentQuestionNumber += 1
                prepareNextQuestion(currentQuestionNumber)
                setHighScore()
            }
        }
        else {
            showAlert(title: "Конец игры",
                      message: "Неверный ответ",
                      okHandler:  ({ [weak self] action in
                        self?.endGame(.lose)
                      }))
            
        }
    }
    
    //Метод установки текущего счета
    private func setHighScore() {
        scoreLabel.text = hightScore[currentQuestionNumber]
    }
    
    //Метод завершения игры
    private func endGame(_ gameEndState: GameEndState) {
        let gameScore = getFinalScore(gameEndState)
        self.deligate?.didEndGame(lose: (gameEndState == .win ? false : true),
                                  score: gameScore,
                                  totalAnswersCount: questions.count,
                                  correctAnswersCount: (gameEndState == .win ? currentQuestionNumber + 1 : currentQuestionNumber))
        self.dismiss(animated: true, completion: nil)
    }
    
    //Метод получения финального счета
    private func getFinalScore(_ gameEndState: GameEndState)-> String{
        switch gameEndState {
        case .lose:
            guard let maxSaftyScore = getSaftyQuestions().filter({$0 <= currentQuestionNumber - 1}).max() else {return "0"}
            return hightScore[maxSaftyScore]
        case .win:
            return hightScore[currentQuestionNumber]
        case .withdraw:
            return (currentQuestionNumber == 0 ? "0" : hightScore[currentQuestionNumber - 1])
        }
    }
    
//  MARK: Buttons
    
    @IBAction func firstAnswerPick(_ sender: Any) {
        checkRightAnswer(0)
    }
    
    @IBAction func secondAnswerPick(_ sender: Any) {
        checkRightAnswer(1)
    }
    
    @IBAction func thirdAnswerPick(_ sender: Any) {
        checkRightAnswer(2)
    }
    
    @IBAction func fourthAnswerPick(_ sender: Any) {
        checkRightAnswer(3)
    }
    
    @IBAction func fiftyFiftyPick(_ sender: Any) {
        fiftyFiftyUsed = true
        let rightAnswer = questions[currentQuestionNumber].rightAnswer
        switch rightAnswer {
        case 0 : secondAnswerButton.isHidden = true
                 fourthAnswerButton.isHidden = true
        case 1 : firstAnswerButton.isHidden = true
                 fourthAnswerButton.isHidden = true
        case 2 : secondAnswerButton.isHidden = true
                 fourthAnswerButton.isHidden = true
        case 3 : firstAnswerButton.isHidden = true
                 secondAnswerButton.isHidden = true
        default:
            break
        }
        updateButtonsVisibility()
        onFiftyFiftyUse?()
    }
    
    @IBAction func friendCallPick(_ sender: Any) {
        friendCallUsed = true
        showAlert(title: "Звонок другу",
                  message: questions[currentQuestionNumber].callFriendPrompt)
        onFriendCallUse?()
    }
    
    @IBAction func audienceHelpPick(_ sender: Any) {
        audienceHelpUsed = true
        let helpPrompt = "\(questions[currentQuestionNumber].answers[0]) : \(questions[currentQuestionNumber].audienceHelp[0])%\n"
            + "\(questions[currentQuestionNumber].answers[1]) : \(questions[currentQuestionNumber].audienceHelp[1])%\n"
            + "\(questions[currentQuestionNumber].answers[2]) : \(questions[currentQuestionNumber].audienceHelp[2])%\n"
            + "\(questions[currentQuestionNumber].answers[3]) : \(questions[currentQuestionNumber].audienceHelp[3])%\n"
        showAlert(title: "Помощь зала",
                  message: helpPrompt)
        onAudienceHelpUse?()
    }
    
    @IBAction func endGame(_ sender: Any) {
        showAlert(title: "Конец игры",
                  message: "Закончить игру и забрать деньги?",
                  okHandler: ({ [weak self] action in
                    self?.endGame(.withdraw)
                      }),
                  cancelHandler: nil,
                  completion: nil)
    }
    
}

//Расширения для установки массива счета и несгораемых сумм
extension GameViewController {
    private func getHighScore() -> [String]{
        return ["1 : 500",
                "2 : 1 000",
                "3 : 2 000",
                "4 : 3 000",
                "5 : 5 000",
                "6 : 10 000",
                "7 : 15 000",
                "8 : 25 000",
                "9 : 50 000",
                "10 : 100 000",
                "11 : 200 000",
                "12 : 400 000",
                "13 : 800 000",
                "14 : 1 500 000",
                "15 : 3 000 000"]
    }
    
    private func getSaftyQuestions ()-> [Int] {
        return [4,9]
    }
}

//Расчширения для экранов сведений
extension GameViewController {
    
    private func showAlert(title: String? = nil,
                   message: String? = nil,
                   okHandler: ((UIAlertAction) -> ())? = nil,
                   cancelHandler: ((UIAlertAction) -> ())? = nil,
                   completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okHandler)
        alertController.addAction(okAction)
        if cancelHandler != nil {
            let cancelAction = UIAlertAction(title: "Cansel", style: .default, handler: cancelHandler)
            alertController.addAction(cancelAction)
        }
        present(alertController, animated: true, completion: completion)
    }
}

//Протокол для делигирования конца игры
protocol GameViewControllerDelegate: class {
    func didEndGame(lose: Bool, score : String, totalAnswersCount: Int, correctAnswersCount: Int)
}
