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
        
        return multiplicationTable * multiplicand
    }
}
