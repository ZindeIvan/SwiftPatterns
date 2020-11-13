//
//  MoveInvoker.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/13/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//
import Foundation
//Класс Invoker для паттерна Command для типа игры с накоплением ходов
class MoveInvoker {

    private let reciever : GameboardView
    
    private var commands: [MoveCommand] = []
    
    init(reciever : GameboardView){
        self.reciever = reciever
    }
    
    func addLogCommand(command: MoveCommand) {
        commands.append(command)
    }
    
    func execute() {
        
        for i in [0,5,1,6,2,7,3,8,4,9] {
            
            if !(reciever.canPlaceMarkView(at: commands[i].position)) {
                reciever.removeMarkView(at: commands[i].position)
            }
            reciever.placeMarkView(commands[i].markView, at: commands[i].position)
            
        }
        
        commands = []
    }
    
}
