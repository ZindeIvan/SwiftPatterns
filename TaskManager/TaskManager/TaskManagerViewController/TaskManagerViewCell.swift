//
//  TaskManagerViewCell.swift
//  TaskManager
//
//  Created by Зинде Иван on 11/16/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit
//Класс ячейка экрана списка задач
class TaskManagerViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var tasksCountLabel: UILabel!
    //Свойство ссылка на текущую задачу
    private var task : ProjectTask?
    //Делегат ячейки
    var deligate : TaskManagerViewCellDeligate?
    //Метод конфигурирования ячейки
    func configure(task: ProjectTask?){
        self.task = task
        taskNameTextField.text = task?.name
        tasksCountLabel.text = "Sub: \(task?.tasks.count ?? 0)"
    }
    //Метод доступа к подзадачам
    @IBAction func editTask(_ sender: Any) {
        deligate?.editTask(task: self.task)
    }
    
    @IBAction func taskNameChanged(_ sender: Any) {
        task?.name = taskNameTextField.text ?? ""
    }
}
