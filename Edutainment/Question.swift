//
//  Question.swift
//  Edutainment
//
//  Created by Giovanni Gaffé on 2021/10/13.
//

import Foundation

struct Question {
    let multiplicationTable = 1
    let answer = "0"
    let questions = [String]()
    
    func getMultiplication(multiplicand: Int) -> Int {
        var localQuestions = [String]()
        for index in 1...12 {

            print("\(multiplicationTable) X \(index) = \(index * multiplicationTable)")
            localQuestions.append("\(index * multiplicationTable)")
        }
        return multiplicationTable * multiplicand
    }
}
