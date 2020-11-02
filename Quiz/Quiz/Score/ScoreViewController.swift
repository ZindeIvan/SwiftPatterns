//
//  ScoreViewController.swift
//  Quiz
//
//  Created by Зинде Иван on 10/30/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit

//Класс контроллер экрана результатов
class ScoreViewController: UITableViewController {
    //Свойство менеджер синглтона игры
    private var gameManager = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //Метод очистки таблицы
    @IBAction func clearScore(_ sender: Any) {
        Game.shared.clearGameSessions()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameManager.gameSessions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreViewCell") as? ScoreViewCell else {fatalError()}
        cell.configureCell(gameSession: gameManager.gameSessions[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
