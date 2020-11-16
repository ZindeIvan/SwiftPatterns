//
//  ProjectTask.swift
//  TaskManager
//
//  Created by Зинде Иван on 11/16/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Класс задачи проекта
class ProjectTask : Task {
    //Свойство имя задачи
    var name: String
    //Свойство массива подзадач
    var tasks: [ProjectTask]
    
    init (name : String?) {
        self.name = name ?? ""
        self.tasks = []
    }
    //Метод добавления подзадачи
    func addTask(task: ProjectTask) {
        self.tasks.append(task)
    }
}
