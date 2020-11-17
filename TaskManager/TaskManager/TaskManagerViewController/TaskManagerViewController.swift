//
//  TaskManagerViewController.swift
//  TaskManagerViewController
//
//  Created by Зинде Иван on 11/16/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit
//Класс контроллер списка задач
class TaskManagerViewController: UITableViewController {
    //Свойство ссылка не текущую задачу
    private var task : ProjectTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        task?.tasks.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskManagerViewCell") as? TaskManagerViewCell else { fatalError() }
        
        cell.configure(task: self.task?.tasks[indexPath.row])
        cell.deligate = self
        return cell
    }
    //Метод конфигурирования элементов
    private func configure() {
        if task == nil {
            task = ProjectTask (name: nil)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTask(_:)))
        
        tableView.register(UINib(nibName: "TaskManagerViewCell", bundle: nil), forCellReuseIdentifier: "TaskManagerViewCell")
    }
    
    //Метод установки текущей задачи
    func setTask(task: ProjectTask?) {
        self.task = task
    }
    //Метод добавления задачи
    @objc func addTask(_ sender: Any) {
        task?.addTask(task: ProjectTask(name: nil))
        tableView.reloadData()
    }
    
}
//Расширение для делигирования ячейки
extension TaskManagerViewController : TaskManagerViewCellDeligate {
    //Обработка метода нажатия кнопки в ячейки
    func editTask(task: ProjectTask?) {
        let taskViewController = TaskManagerViewController()
        taskViewController.setTask(task: task)
        self.navigationController?.pushViewController(taskViewController, animated: true)
    }
    
}
