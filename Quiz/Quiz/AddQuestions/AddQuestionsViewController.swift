//
//  AddQuestionsViewController.swift
//  Quiz
//
//  Created by Зинде Иван on 11/6/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit
//Класс контроллер экрана добавления вопросов
class AddQuestionsViewController : UIViewController {
    
    @IBOutlet private weak var questionsTopicSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var questionsTableView: UITableView!
    @IBOutlet private weak var userQuestionsSwitch: UISwitch!
    
    //Свойство пользовательских вопрос
    private var userQuestions : [Question] = [] {
        didSet{
            UserQuestionsCaretaker(topic: getQuestionsTopic()).save(questions: self.userQuestions)
        }
    }
    
    //Синглтон игры
    private let gameManager = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsTableView.dataSource = self
        questionsTableView.delegate = self
        configureUI()
        loadUserQuestions()
        
    }
    //Метод обработки действия смены темы вопросов
    @IBAction func questionsTopicSegmentControlValueChanged(_ sender: Any) {
        loadUserQuestions()
        questionsTableView.reloadData()
    }
    //Метод обработки действия добавления нового вопроса
    @IBAction func addNewQuestion(_ sender: Any) {
        let newQuestion = Question.init(questionText: "",
                                        answers: [],
                                        rightAnswer: 0,
                                        callFriendPrompt: "",
                                        audienceHelp: [])
        userQuestions.append(newQuestion)
        questionsTableView.reloadData()
    }
    //Метод обработки действия использования пользовательских впоросов
    @IBAction func userQuestionsSwitchAction(_ sender: Any) {
        gameManager.useUserQuestions = userQuestionsSwitch.isOn
    }
    
    //Метод настройки элементов экрана
    private func configureUI() {
        questionsTopicSegmentedControl.removeAllSegments()
        questionsTopicSegmentedControl.insertSegment(withTitle: QuestionsTopic.Comics.rawValue, at: 0, animated: false)
        questionsTopicSegmentedControl.insertSegment(withTitle: QuestionsTopic.Science.rawValue, at: 1, animated: false)
        questionsTopicSegmentedControl.selectedSegmentIndex = 0
        userQuestionsSwitch.isOn = gameManager.useUserQuestions
    }
    //Метод получения темы вопросов
    private func getQuestionsTopic() -> QuestionsTopic{
        
        switch questionsTopicSegmentedControl.selectedSegmentIndex {
            
        case 0 :
            return .Comics
        case 1 :
            return .Science
        default:
            return .Comics
        }
    }
    //Метод загрузки пользовательских вопросов
    private func loadUserQuestions() {
        userQuestions = UserQuestionsCaretaker(topic: getQuestionsTopic()).retrieveRecords()
    }
}
//Поддержка протоколов работы с таблицой
extension AddQuestionsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddQuestionsViewCell") as? AddQuestionsViewCell else { fatalError() }
        
        cell.configureCell(question: userQuestions[indexPath.row], questionIndex: indexPath.row)
        cell.deligate = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        271
    }
    
}

extension AddQuestionsViewController : UITableViewDelegate {
    
}

//Расширения делегирования действий из ячейки таблицы
extension AddQuestionsViewController : AddQuestionsViewCellDeligate {
    //Метод изменения элементов вопроса
    func questionChanged(question: Question, questionIndex: Int) {
        userQuestions[questionIndex] = question
    }
}
