//
//  Question Model.swift
//  wakeUpAppGames
//
//  Created by Gobind Puniani on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import GameKit

struct QuestionModel {
    
    static func questionModel(question question: String, correctAnswer: String, incorrectAnswer1: String,
                              incorrectAnswer2: String) -> [String : String] {
        
        let unshuffledOptions: [String] = [correctAnswer, incorrectAnswer1, incorrectAnswer2]
        let options = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: unshuffledOptions) as! [String]
        
        return [ questionKey: question, option1Key: options[0], option2Key: options[1], option3Key: options[2], answerKey: correctAnswer ]
    }
}
