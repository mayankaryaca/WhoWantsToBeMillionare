//
//  Round.swift
//  WhoWantsToBeAMillionare
//

import Foundation

class Round : QuestionSet, OptionMenu {
//  conforming func printOptionMenu from protocol OptionMenu
//  func printOptionMenu
//  Args1 roundNumber : Int
//  Operation : Prints option menu for the current round which inclues prepareing the question bank,question display and providing the choices
    func printOptionMenu(roundNumber : Int) {
        
        if(roundNumber == 3){
            canUseHelpline.toggle()
        }
        
        if(self.continueGame == true ){
              self.roundNumber = roundNumber
              let questionSet = QuestionSet(roundNumber: roundNumber, questionNumber : 0)
              questionSet.setQuestionBank(roundNum: roundNumber)
              self.questionBank = questionSet.randomQuestionSet()

              let keys = Array<Int>(questionBank.keys)
              for i in 0..<keys.count{
                  if(self.wrongInput == false){
                    questionNumber = i + 1
                    print("*************************")
                    print("Current Winnings : $\(displayWinningAmount)")
                    let answer = questionSet.getAnswerCode(roundNumber : roundNumber,questionNumber: keys[i],questionNumberDisplay : questionNumber, questionBank: questionBank)
                    self.questionNumberDisplay = questionSet.printQuestion(roundNumber : self.roundNumber,questionNumber: keys[i],questionNumberDisplay : questionNumber, questionBank: questionBank)
                    
                     UserAnswerCheckUpdate(systemAnswer: answer,questionNumber : keys[i] , questionBank: questionBank)
                  }
             }
         }
    }

    var continueGame : Bool
    var winningAmount : Int
    var displayWinningAmount : Int = 0
    var takeAwayWinningAmount : Int
    var wrongInput : Bool
    var winnings : Int{
        if( roundNumber == 1  && (questionNumber) == 3){
            self.takeAwayWinningAmount = 10000
            self.winningAmount = 10000
            displayWinningAmount = 10000

        }else if(roundNumber == 2  && (questionNumber) == 3){
            displayWinningAmount = 100000
            self.takeAwayWinningAmount = 100000
            self.winningAmount = 100000
        }else if(roundNumber == 3 && (questionNumber) == 1 ){
            displayWinningAmount = 250000
            self.takeAwayWinningAmount = 100000
            self.winningAmount = 250000
        }
        else if(roundNumber == 3 && (questionNumber) == 2 ){
            displayWinningAmount = 500000
            self.winningAmount = 500000
            self.takeAwayWinningAmount = 100000
        }
        else if(roundNumber == 3 && (questionNumber) == 3 ){
            self.winningAmount = 1000000
            self.takeAwayWinningAmount = 100000
        }else{
            self.winningAmount = 0
        }
        return self.winningAmount
    }
    var canUseHelpline : Bool
    var helpline1 : Bool
    var helpline2 : Bool
    var questionNumberDisplay : Int = 0

    
    init(roundNumber : Int, questionNumber : Int, winningAmount : Int,takeAwayWinningAmount : Int ,continueGame : Bool , wrongInput : Bool, canUseHelpline : Bool, helpline1 : Bool, helpline2 : Bool){
        self.winningAmount = winningAmount
        self.takeAwayWinningAmount = takeAwayWinningAmount
        self.continueGame = continueGame
        self.wrongInput = wrongInput
        self.canUseHelpline = canUseHelpline
        self.helpline1 = helpline1
        self.helpline2 = helpline2
        super.init(roundNumber: roundNumber, questionNumber: questionNumber)
    }

//  func - checkAnswer
//  Args1 systemAnswer : String,
//  Args2 questionNumber : Int
//  Operation : takes the input from user, confirms the input and then compare it with the answer.Also, handling in case of wrong(display game over. end the game) and nil input(asks the input again from user)
    func CheckAnswer(systemAnswer : String, questionNumber : Int){
        print("Enter the answer option")
        let inputAnswer : String? = readLine()
        if let inputAns = inputAnswer{
            print("Is this your final answer?  Enter 1 to submit, any other key to submit a different answer")
            let input : String? = readLine()
            if let inputRead = input{
                if(inputRead == "1"){
                    if(inputAns.uppercased() == systemAnswer){
                        print("Your answer is correct. The correct answer was : \(inputAns.uppercased())")
                        print("Amount won for correct answer : $\(winnings)")
                        if(winnings == 1000000){
                            print("********************************************")
                            print("Congrats! You are a millionare. You are going home with $\(winnings). Best of Luck!")
                        }
                    }else{
                        continueGame.toggle()
                        wrongInput.toggle()
                   
                        
                        print("Game Over.  The correct answer was : \(systemAnswer.uppercased())")
                        print("********************************************")
                        print("You reached till Question number : \(questionNumberDisplay)")
                        print("You are going home with $\(takeAwayWinningAmount). Best Of Luck!")

                    }
                }else{
                    UserAnswerCheckUpdate(systemAnswer: systemAnswer,questionNumber : questionNumber , questionBank : questionBank)
                }
            }
        }
    }
    
//  func  WalkAwayOrContinue
//  Args  No Arguments
//  Operation : Provides the user with the choice to walk away or continue the game.
    func WalkAwayOrContinue(){
        print("*************************")
        print("Do you want to walk away with or continue?")
        print("1 : Walk Away with $\(winnings)")
        print("Any Key : Continue")
        let input : String? = readLine()
        if let userInput = input{
            if(userInput == "1"){
                continueGame.toggle()
                wrongInput.toggle()
                print("********************************************")
                print("You reached till Question number : \(questionNumberDisplay) and decided to leave.")
                print("Congrats! You are going home with $\(takeAwayWinningAmount). Best Of Luck!")
            }
                
        }
    }
    
//  func userAnswerCheckUpdate
//  Args1 systemAnswer : String
//  Args2 questionNumber : Int
//  Args3 questionBank : [Int : Question]
//  Operation : prints the submit answer menu and checks answers. Also, provide options as per round and question Number
    func UserAnswerCheckUpdate( systemAnswer : String, questionNumber : Int,questionBank : [Int : Question]) {
        print("********** Enter **********")
        print("1 : Submit an Answer")
        if(canUseHelpline){
            print("2 : Helpline")
        }
        
        let input : String? = readLine()
        if(continueGame == true){
            if let userInput = input{
                switch userInput {
                case "1":
                    CheckAnswer(systemAnswer: systemAnswer, questionNumber: questionNumber)
                    
                    if((((self.roundNumber == 1 || self.roundNumber == 2) && self.questionNumber == 3) || (roundNumber == 3 && (self.questionNumber == 1 || self.questionNumber == 2))) && continueGame == true){
                        WalkAwayOrContinue()
                    }

                case "2":
                    if(self.canUseHelpline){
                        Helpline(questionNumber: questionNumber, systemAnswer: systemAnswer)
                    }else{
                        print("Helpline not available in Round 3")
                        UserAnswerCheckUpdate(systemAnswer: systemAnswer,questionNumber : questionNumber , questionBank: questionBank)
                    }
                case "3":
                    continueGame.toggle()
                    wrongInput.toggle()
                    print("Game Over")
                    break
                default :
                    print("Ivalid Input.Please enter the correct option!")
                    UserAnswerCheckUpdate(systemAnswer: systemAnswer,questionNumber : questionNumber , questionBank: questionBank)
                  }
                }else{
                    continueGame.toggle()
                    wrongInput.toggle()
            }
        }
    }
  
//  func helpline
//  Args1 questionNumber : Int,
//  Args2 systemAnswer : String
//  Operation : Provides helpline menu and does appropriate checks to handle cases
    func Helpline(questionNumber : Int, systemAnswer : String){
        var helpNumber : String = "0"

        print("********** HELP LINE **********")
        if(helpline1 == false){
            print("1 : 50/50")
        }else{
            print("1 : 50/50 - USED")
        }
        if (helpline2 == false){
            print("2 : Ask the Audience")
        }else{
            print("2 : Ask the Audience - USED")
        }
        
        let inputHelplineNumber : String? = readLine()
        if let inputNumber = inputHelplineNumber{
            helpNumber = inputNumber
         }
        
        switch helpNumber {
        case "1" :
            if(helpline1 == false){
                helpline1.toggle()
                RandomFiftyFiftyOptionCodeGenerator(answerCode : systemAnswer,questionNumber : questionNumber, questionBank : questionBank)
                CheckAnswer(systemAnswer: systemAnswer,questionNumber: questionNumber)
            }else{
                print("You can not use this lifeline again!")
                UserAnswerCheckUpdate(systemAnswer: systemAnswer,questionNumber : questionNumber , questionBank: questionBank)
            }
   
        case "2" :
            if(helpline2 == false){
                helpline2.toggle()
                AudiencePoll(answerCode: systemAnswer)
                CheckAnswer(systemAnswer: systemAnswer, questionNumber: questionNumber)
            }else{
                print("You can not use this lifeline again!")
                UserAnswerCheckUpdate(systemAnswer: systemAnswer,questionNumber : questionNumber , questionBank: questionBank)
            }
        default :
            print("Invalid Input!")
            UserAnswerCheckUpdate(systemAnswer: systemAnswer,questionNumber : questionNumber , questionBank: questionBank)
        }
    }
    
//  func randomFiftyFiftyOptionCodeGenerator
//  Args1 answerCode : String,
//  Args2 questionNumber : Int ,
//  Args3 questionBank : [Int : Question])
//  Operation : generations two options for a question. One random selection and one correct answer
    func RandomFiftyFiftyOptionCodeGenerator(answerCode : String,questionNumber : Int ,questionBank : [Int : Question]){
        let options = ["A" , "B" , "C" , "D"]
        
        var randomOptionCode : String
        var randomCodeCheck : Bool = false
            repeat{
                randomOptionCode = options.randomElement()!
                if(randomOptionCode != answerCode){
                    randomCodeCheck.toggle()
                }
            }while(randomCodeCheck == false)
        
       
        switch randomOptionCode {
        case "A":
            print("\(questionBank[questionNumber]!.optioncode1). \(questionBank[questionNumber]!.option1)")
        case "B":
            print("\(questionBank[questionNumber]!.optioncode2). \(questionBank[questionNumber]!.option2)")
        case "C":
            print("\(questionBank[questionNumber]!.optioncode3). \(questionBank[questionNumber]!.option3)")
        case "D":
            print("\(questionBank[questionNumber]!.optioncode4). \(questionBank[questionNumber]!.option4)")
        
        default:
            print("Error")
        }
        print("\(questionBank[questionNumber]!.answerOptionCode). \(questionBank[questionNumber]!.answerStringCode)")
          }
    
//  func audiencePoll
//  Args1 answerCode : String
//  Operation : generates an array of size 12. in which 9 are correct answer choices. 3 are incorrect answer choice. each choice has a probability of 1/12. For 9 correct choice the probability is 9/12. The chance of choosing a random value which is a correct answer reaches 75%
    func AudiencePoll(answerCode : String){
        var arrayProbability : [String] = []
        let options = ["A" , "B" , "C" , "D"]
        
        for i in 1...12{
            if( i <= 9 ){
                arrayProbability.append(answerCode)
            }else{
                var randomCode : String
                var randomCodeCheck : Bool = false
                    repeat{
                        randomCode = options.randomElement()!
                        if(randomCode != answerCode){
                            arrayProbability.append(randomCode)
                            randomCodeCheck.toggle()
                        }
                    }while(randomCodeCheck == false)
            }
        }

        print("Audience says the correct answer is : \(arrayProbability.randomElement()!)")
        
    }

}
