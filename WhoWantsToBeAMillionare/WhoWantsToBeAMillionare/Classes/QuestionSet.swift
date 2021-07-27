//
//  QuestionSet.swift
//  WhoWantsToBeAMillionare
//

import Foundation

class QuestionSet {
 
    var roundNumber : Int
    var questionNumber : Int
    var questionBank : [ Int : Question ] = [ : ]
    var currentQuestionNumber : [Int] = []
    var currentQuestionList : [ Int : Question ] = [ : ]
    
    init(roundNumber : Int , questionNumber : Int){
        self.roundNumber = roundNumber
        self.questionNumber = questionNumber
    }

//    func calculateCurrentNumberOfQuestion
//    Args1 roundNumber : Int,
//    Args2 questionNumberDisplay : Int
//    Operation : calculate position Of current Question
    func calculateCurrentNumberOfQuestion(roundNumber : Int, questionNumberDisplay : Int) -> Int{
        var printCodeOfQuestion = 0
        if(roundNumber == 2){
            printCodeOfQuestion = questionNumberDisplay+3
        }else if(roundNumber == 3){
            printCodeOfQuestion = questionNumberDisplay+6
        }else{
            printCodeOfQuestion = questionNumberDisplay
        }
        return printCodeOfQuestion
    }
    
//    func calculateNumberOfRemainingQuestions
//    Args1 roundNumber : Int,
//    Args2 questionNumberDisplay : Int
//    Operation : calculate Number Of Remaining Questions
    func calculateNumberOfRemainingQuestions(roundNumber : Int, questionNumberDisplay : Int) -> Int{
        var printCodeOfRemainingQuestions = 0
        if(roundNumber == 2){
            printCodeOfRemainingQuestions = 6-questionNumberDisplay

        }else if(roundNumber == 3){
            printCodeOfRemainingQuestions = 3-questionNumberDisplay

        }else{
            printCodeOfRemainingQuestions = 9-questionNumberDisplay
        }
        return printCodeOfRemainingQuestions
    }
    
    //  func printQuestion
    //  Args1 roundNumber : Int,
    //  Args2 questionNumber : Int,
    //  Args3 questionNumberDisplay : Int,
    //  Args4 questionBank : [Int : Question]
    //  Operation : prints the current question
    func printQuestion(roundNumber : Int,questionNumber : Int, questionNumberDisplay : Int, questionBank : [Int : Question]) -> Int{
        print("*************************")
        let printCodeOfQuestion = calculateCurrentNumberOfQuestion(roundNumber : roundNumber, questionNumberDisplay : questionNumberDisplay)
        let printCodeOfRemainingQuestions = calculateNumberOfRemainingQuestions(roundNumber : roundNumber, questionNumberDisplay : questionNumberDisplay)
       
        print("Round : \(roundNumber) --- Question number : \(printCodeOfQuestion) --- Question Remaining : \(printCodeOfRemainingQuestions)")
        print("*************************")

        print(questionBank[questionNumber]!.question)
        print("\(questionBank[questionNumber]!.optioncode1). \(questionBank[questionNumber]!.option1)")
        print("\(questionBank[questionNumber]!.optioncode2). \(questionBank[questionNumber]!.option2)")
        print("\(questionBank[questionNumber]!.optioncode3). \(questionBank[questionNumber]!.option3)")
        print("\(questionBank[questionNumber]!.optioncode4). \(questionBank[questionNumber]!.option4)")
        
        return printCodeOfQuestion
    }
    
    //  func getAnswerCode
    //  Args1 roundNumber : Int,
    //  Args2 questionNumber : Int,
    //  Args3 questionNumberDisplay : Int,
    //  Args4 questionBank : [Int : Question]
    //  Operation : returns the current question answer
    func getAnswerCode(roundNumber : Int,questionNumber : Int, questionNumberDisplay : Int, questionBank : [Int : Question]) -> String{
        return questionBank[questionNumber]!.answerOptionCode
    }
    
//  func setQuestionBank
//  Args1 roundNum : Int
//  Operation : initialses a question bank as per easy, medium and difficult as per round number
    func setQuestionBank(roundNum : Int){
        let questionround1_1 : Question = Question(question: "Where is CN tower?",option1: "Los Angeles",option2: "New York",option3: "Delhi",option4: "Toronto", answerStringCode: "Toronto",answerOptionCode: "D")
        let questionround1_2 : Question = Question(question: "Which chess piece can't move in a straight line?",option1: "Knight",option2: "King",option3: "Bishop",option4: "Rook", answerStringCode: "Knight",answerOptionCode : "A")
        let questionround1_3 : Question = Question(question: "Name the currency used in Japan?",option1: "Taka",option2: "Dinar",option3: "Dollars",option4: "Yen",answerStringCode: "Yen",answerOptionCode: "D")
        let questionround1_4 : Question = Question(question: "In which country is the Leaning Tower of Pisa located?", option1: "England", option2: "USA", option3: "Italy", option4: "France", answerStringCode: "Italy", answerOptionCode: "C")
        let questionround1_5 : Question = Question(question: "In which year the world war 2 ended?", option1: "1941", option2: "1943", option3: "1945", option4: "1947", answerStringCode: "1945", answerOptionCode: "C")
        let questionround2_1 : Question = Question(question: "What's a supernova?", option1: "An underwater volcano", option2: "An intense lightning storm", option3: "The explosion of a star", option4: "The eye of tornado", answerStringCode: "Yhe explosion of star", answerOptionCode: "C")
        let questionround2_2 : Question = Question(question: "What's the technical term for a lie detector?", option1: "PolyGraph", option2: "Seismograph", option3: "Teragraph", option4: "Omnigraph", answerStringCode: "Polygraph", answerOptionCode: "A")
        let questionround2_3 : Question = Question(question: "'In the beginning' are the first three words of which famous book?", option1: "Harry Potter", option2: "The old man and the sea", option3: "Breakfast of champions", option4: "The Bible", answerStringCode: "The Bible", answerOptionCode: "D")
        let questionround2_4 : Question = Question(question: "What's the Spanish word for fox?", option1: "Perro", option2: "Zorro", option3: "Lobo", option4: "Ballena", answerStringCode: "Zorro", answerOptionCode: "B")
        let questionround2_5 : Question = Question(question: "Choose the chemical symbol for potassium", option1: "Ts", option2: "P", option3: "K", option4: "Pt", answerStringCode: "K", answerOptionCode: "C")
        let questionround3_1 : Question = Question(question: "Which philosopher said, 'I think, therefore I am?'", option1: "Friedrich Nietzsche", option2: "John Locke", option3: "Immanuel Kant", option4: "Rene Descartes", answerStringCode: "Rene Descartes", answerOptionCode: "D")
        let questionround3_2 : Question = Question(question: "How many bones are there in an elephant's trunk?", option1: "0", option2: "12", option3: "24", option4: "144", answerStringCode:"0", answerOptionCode: "A")
        let questionround3_3 : Question = Question(question: "What was the official name of Thailand before 1939?", option1: "Ankara", option2: "Burma", option3: "Siam", option4: "Ceylon", answerStringCode: "Siam", answerOptionCode: "C")
        let questionround3_4 : Question = Question(question: "In Greek mythology, who is the Goddess of Agriculture?", option1: "Rha", option2: "Demeter", option3: "Persephone", option4: "Hygiela", answerStringCode: "Demeter", answerOptionCode: "B")
        let questionround3_5 : Question = Question(question: "What's an echidna?", option1: "An insect that dwells underground", option2: "An edible remedy for pain relief", option3: "A Spanish dessert", option4: "A mammal native to Australia", answerStringCode: "A mammal native to Australia", answerOptionCode: "D")

        switch roundNum {
        case 1:
            questionBank.removeAll()
            questionBank.updateValue(questionround1_1 , forKey: 1)
            questionBank.updateValue(questionround1_2 , forKey: 2)
            questionBank.updateValue(questionround1_3 , forKey: 3)
            questionBank.updateValue(questionround1_4 , forKey: 4)
            questionBank.updateValue(questionround1_5 , forKey: 5)
        case 2:
            questionBank.removeAll()
            questionBank.updateValue(questionround2_1 , forKey: 1)
            questionBank.updateValue(questionround2_2 , forKey: 2)
            questionBank.updateValue(questionround2_3 , forKey: 3)
            questionBank.updateValue(questionround2_4 , forKey: 4)
            questionBank.updateValue(questionround2_5 , forKey: 5)
        case 3:
            questionBank.removeAll()
            questionBank.updateValue(questionround3_1 , forKey: 1)
            questionBank.updateValue(questionround3_2 , forKey: 2)
            questionBank.updateValue(questionround3_3 , forKey: 3)
            questionBank.updateValue(questionround3_4 , forKey: 4)
            questionBank.updateValue(questionround3_5 , forKey: 5)
        default:
            print("in default question bank . error!")
        }
        
     }
    
//  func checkNumber
//  Args1 number : Int
//  Operation : Checks if the question number has already been selected,  if not then return bool value
    func checkNumber(number : Int) -> Bool{
        var checkExist : Bool = false

            if(currentQuestionNumber.contains(number) == false){
                currentQuestionNumber.append(number)
            }else{
                checkExist.toggle()
            }
        return checkExist
    }

//  func randomQuestionSet
//  Args No Arguments required
//  Operation : selects 3 question from set of questions from a level of difficulty and return them
    func randomQuestionSet() -> [Int : Question]{
        for _ in 0..<3{
            var randomNumber : Int
            repeat{
               randomNumber =  Int.random(in: 1...5)
            }while(checkNumber(number: randomNumber) == true)
        }
        for i in 0..<currentQuestionNumber.count{
            currentQuestionList.updateValue(questionBank[currentQuestionNumber[i]]!, forKey: i)
        }
        currentQuestionNumber = []
        return currentQuestionList
    }
}
