//
//  LogInvoker.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

class LogInvoker {
    
    public static let shared = LogInvoker()
    
    private let receiver = LogReceiver()
    private let bufferSize = 6
    
    private var commands: [LogCommand] = []
    
    func addLogCommand(command: LogCommand) {
        commands.append(command)
        execute()
    }
    
    private func execute() {
        guard commands.count >= bufferSize else {
            return
        }
        
        commands.forEach { receiver.sendMessageToServerLog(message: $0.logMessage) }
        commands = []
    }
    
}
