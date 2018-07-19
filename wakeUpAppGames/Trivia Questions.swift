//
//  Trivia Questions.swift
//  wakeUpAppGames
//
//  Created by Gobind Puniani on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import GameKit
import UIKit

let questionKey = "Question"
let option1Key = "Option 1"
let option2Key = "Option 2"
let option3Key = "Option 3"
let answerKey = "Answer"

struct TriviaModel {
    
    var trivia: [[String : String]]
    let unshuffledTrivia: [[String : String]] = [
        QuestionModel.questionModel(question: "Who was the only US President to serve more than two consecutive terms?", correctAnswer: "Franklin D. Roosevelt", incorrectAnswer1: "George Washington", incorrectAnswer2: "Grover Cleveland"),
        QuestionModel.questionModel(question: "Which country won the FIFA World Cup in 2018?", correctAnswer: "France", incorrectAnswer1: "England", incorrectAnswer2: "Croatia"),
        QuestionModel.questionModel(question: "How many quarks comprise a proton?", correctAnswer: "3", incorrectAnswer1: "6", incorrectAnswer2: "2"),
        QuestionModel.questionModel(question: "Solve for x: 3x - 11 = 13", correctAnswer: "8", incorrectAnswer1: "4", incorrectAnswer2: "10"),
        QuestionModel.questionModel(question: "What is the square root of 169?", correctAnswer: "13", incorrectAnswer1: "12", incorrectAnswer2: "11"),
        QuestionModel.questionModel(question: "What is 50 Cent's real name?", correctAnswer: "Curtis Jackson", incorrectAnswer1: "Sean Combs", incorrectAnswer2: "Shawn Carter"),
        QuestionModel.questionModel(question: "Of the following, which university was founded first?", correctAnswer: "University of Oxford", incorrectAnswer1: "University of Cambridge", incorrectAnswer2: "Harvard University"),
        QuestionModel.questionModel(question: "Which of the following fractions reduces to 1/2?", correctAnswer: "250/500", incorrectAnswer1: "20/60", incorrectAnswer2: "4/10"),
        QuestionModel.questionModel(question: "Including the Bill of Rights, how many amendments does the U.S. Constitution currently have?", correctAnswer: "27", incorrectAnswer1: "13", incorrectAnswer2: "50"),
        QuestionModel.questionModel(question: "What is the chemical symbol for gold?", correctAnswer: "Au", incorrectAnswer1: "Gd", incorrectAnswer2: "Ag"),
        QuestionModel.questionModel(question: "Which of the following numbers is both a perfect square and a perfect cube?", correctAnswer: "64", incorrectAnswer1: "25", incorrectAnswer2: "125"),
        QuestionModel.questionModel(question: "Which of the following Founding Fathers did NOT die on July 4, 1826?", correctAnswer: "Benjamin Franklin", incorrectAnswer1: "Thomas Jefferson", incorrectAnswer2: "John Adams"),
        QuestionModel.questionModel(question: "What is the chemical symbol for mercury?", correctAnswer: "Hg", incorrectAnswer1: "Mc", incorrectAnswer2: "Cu"),
        QuestionModel.questionModel(question: "What is Black Panther's real name?", correctAnswer: "T'Challa", incorrectAnswer1: "T'Chanka", incorrectAnswer2: "T'Charro")
    ]
    
    init() {
        trivia = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: unshuffledTrivia) as! [[String : String]]
    }
    
    mutating func randomTrivia() -> [String : String]? {
        return self.trivia.popLast()
    }
}
