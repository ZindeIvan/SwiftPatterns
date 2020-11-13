//
//  GameViewController.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    private let gameBoard = Gameboard()
    private lazy var referee = Referee(gameboard: gameBoard)
    private var currentState: GameState! {
        didSet {
            currentState.begin()
        }
    }
    var counter: Int = 0

    @IBOutlet var gameboardView: GameboardView!
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var yourTurnLabel: UILabel!
    
    var gameType : GameType?
    private var moveInvoker : MoveInvoker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveInvoker = MoveInvoker(reciever: gameboardView)
        setFirstState()
        
        gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
            self.counter += 1
            self.currentState.addMark(at: position)
            if self.currentState.isMoveCompleted {
                self.setNextState()
            }
        }
    }
    
    private func setFirstState() {
        let player = Player.first
        if gameType == GameType.stackMoves {
            currentState = StackMovesState(player: player, gameViewController: self, markViewPrototype: player.markViewPrototype, moveInvoker: moveInvoker ?? MoveInvoker(reciever: gameboardView))
        } else {
            currentState = PlayerState(player: player, gameViewController: self,
                                   gameBoard: gameBoard, gameBoardView: gameboardView,
                                   markViewPrototype: player.markViewPrototype)
        }
    }
    
    func setNextState() {
        
        if gameType == GameType.stackMoves{
            if currentState is ExecuteMovesState {
                let winner = referee.determineWinner()
                currentState = GameOverState(winner: winner, gameViewController: self)
            } else if counter == 5 {
                if let stackMoveState = currentState as? StackMovesState {
                    let player = stackMoveState.player.next
                    currentState = StackMovesState(player: player, gameViewController: self, markViewPrototype: player.markViewPrototype, moveInvoker: moveInvoker ?? MoveInvoker(reciever: gameboardView))
                }
            } else if counter == 10 {
                currentState = ExecuteMovesState(gameViewController: self, moveInvoker: moveInvoker ?? MoveInvoker(reciever: gameboardView))
            } else {
                return
            }
            return
        }
        
        
        if let winner = referee.determineWinner() {
            currentState = GameOverState(winner: winner, gameViewController: self)
            return
        }
        
        if counter >= 9 {
            currentState = GameOverState(winner: nil, gameViewController: self)
            return
        }
        
        if let playerInputState = currentState as? PlayerState {
            let player = playerInputState.player.next
            if gameType == GameType.versusPlayer {
                currentState = PlayerState(player: playerInputState.player.next, gameViewController: self,
                                           gameBoard: gameBoard, gameBoardView: gameboardView,
                                           markViewPrototype: player.markViewPrototype)
            } else {
                currentState = AIState(player: playerInputState.player.next, gameViewController: self,
                                                          gameBoard: gameBoard, gameBoardView: gameboardView,
                                                          markViewPrototype: player.markViewPrototype)
            }
        }
        
        if let AIInputState = currentState as? AIState {
            let player = AIInputState.player.next
            currentState = PlayerState(player: AIInputState.player.next, gameViewController: self,
                                       gameBoard: gameBoard, gameBoardView: gameboardView,
                                       markViewPrototype: player.markViewPrototype)
        }
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        Log(action: .restartGame)
        
        gameboardView.clear()
        gameBoard.clear()
        setFirstState()
        counter = 0
        
    }
}

