//
//  Question.swift
//  WhoWantsToBeAMillionare
//

import Foundation

struct Question {
    var question : String
    var option1 : String
    var optioncode1 : String = "A"
    var option2 : String
    var optioncode2 : String = "B"
    var option3 : String
    var optioncode3 : String = "C"
    var option4 : String
    var optioncode4 : String = "D"
    var answerStringCode : String
    var answerOptionCode : String
    
    init(question : String, option1 : String, option2 : String, option3 : String, option4 : String, answerStringCode : String, answerOptionCode : String){
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.answerStringCode = answerStringCode
        self.answerOptionCode = answerOptionCode
    }

}
