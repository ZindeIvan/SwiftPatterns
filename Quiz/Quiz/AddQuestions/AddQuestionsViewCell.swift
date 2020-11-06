//
//  AddQuestionsViewCell.swift
//  Quiz
//
//  Created by Зинде Иван on 11/6/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit
//Класс контроллер ячейки таблицы добавления вопросов
class AddQuestionsViewCell : UITableViewCell {
   
    @IBOutlet private weak var questionTextField : UITextField!
    @IBOutlet private weak var firstAnswerTextField : UITextField!
    @IBOutlet private weak var secondAnswerTextField : UITextField!
    @IBOutlet private weak var thirdAnswerTextField : UITextField!
    @IBOutlet private weak var fourthAnswerTextField : UITextField!
    @IBOutlet private weak var correctAnswerSegmentedControl: UISegmentedControl!
    //Делигат ячейки
    var deligate  : AddQuestionsViewCellDeligate?
    //Номер вопроса
    private var questionIndex : Int = 0
    //Методы смены текста соответсвующих полей
    @IBAction func questionTextFieldChanged(_ sender: Any) {
        questionChanged ()
    }
    
    @IBAction func firstAnswerTextFieldChanged(_ sender: Any) {
        questionChanged ()
    }
    
    @IBAction func secondAnswerTextFieldChanged(_ sender: Any) {
        questionChanged ()
    }
    
    @IBAction func thirdAnswerTextFieldChanged(_ sender: Any) {
        questionChanged ()
    }
    
    @IBAction func fourthAnswerTextFieldChanged(_ sender: Any) {
        questionChanged ()
    }
    //Метод смены правильного ответа
    @IBAction func correctAnswerSegmentedControlChanged(_ sender: Any) {
        questionChanged ()
    }
    //Метод конфигурирования ячейки
    func configureCell (question : Question, questionIndex : Int) {
        self.questionTextField.text = question.questionText
        if question.answers.count == 4 {
            self.firstAnswerTextField.text = question.answers[0]
            self.secondAnswerTextField.text = question.answers[1]
            self.thirdAnswerTextField.text = question.answers[2]
            self.fourthAnswerTextField.text = question.answers[3]
        }
        
        if (0...3).contains(question.rightAnswer){
            correctAnswerSegmentedControl.selectedSegmentIndex = question.rightAnswer
        }
        
        self.questionIndex = questionIndex
    }
    //Метод создания вопроса на основании элементов ячейки
    private func createQuestion() -> Question {
        
        var answers : [String] = []
        answers.append(firstAnswerTextField.text ?? "")
        answers.append(secondAnswerTextField.text ?? "")
        answers.append(thirdAnswerTextField.text ?? "")
        answers.append(fourthAnswerTextField.text ?? "")
        
        let correctAnswerIndex = correctAnswerSegmentedControl.selectedSegmentIndex
        
        let callFriendPrompt : String = "Наверное ответ \(answers[correctAnswerIndex])"
        
        var audienceHelp : [Float] = []
        
        for i in 0...3 {
            if i == correctAnswerIndex {
                audienceHelp.append(70)
            } else {
                audienceHelp.append(10)
            }
        }
        
        return Question(questionText: questionTextField.text ?? "",
                        answers: answers,
                        rightAnswer: correctAnswerIndex,
                        callFriendPrompt: callFriendPrompt,
                        audienceHelp: audienceHelp)
    }
    //Метод обработки изменения элементов ячейки
    private func questionChanged () {
        let question = createQuestion()
        deligate?.questionChanged(question: question, questionIndex: questionIndex)
    }
    
}
//Протокол делигирования ячейки
protocol AddQuestionsViewCellDeligate {
    func questionChanged(question: Question, questionIndex: Int)
}
