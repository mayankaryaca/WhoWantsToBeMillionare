//
//  Game.swift
//  WhoWantsToBeAMillionare
//

import Foundation

class Game : OptionMenu {
    
//  conforming func printOptionMenu from protocol OptionMenu
//  func printOptionMenu
//  Args1 roundNumber : Int
//  Operation : Prints welcome msg and provides play or exit game choices. Initalises the Round class object and start the game.
    func printOptionMenu(roundNumber: Int) {
        print("*************************")
        print("Welcome to Who wants to be a Millionare")
        print("Press any key to start the game")
        print("To Exit, press 0")
        
        let input : String? = readLine()
        if let inputRead = input{
            if(inputRead == "0"){
                print("You Quit the game. See you soon")
            }else{
                let game = Round(roundNumber: roundNumber, questionNumber: 1, winningAmount : 0, takeAwayWinningAmount: 0, continueGame: true, wrongInput: false, canUseHelpline: true, helpline1: false, helpline2: false)
                for i  in 1...3{
                    game.printOptionMenu(roundNumber: i)
                }
            }
            
        }
    }
}
