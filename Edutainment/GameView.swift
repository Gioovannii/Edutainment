//
//  GameView.swift
//  Edutainment
//
//  Created by Giovanni Gaffé on 2021/10/29.
//

import SwiftUI

struct GameView: View {
    let questions: [Question]
    let numberQuestion: Int
    let callback: () -> ()
    
    @State private var answerAmount = ""
    @State private var currentQuestion = 1
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var correctNumber = 0
    
    var body: some View {
        Form {
            HStack {
                Text("Current question: \(currentQuestion) of \(numberQuestion)")
                Spacer()
                Text("Your score: \(score)")
            }
            
            Text(questions[currentQuestion].text).font(.largeTitle).padding()
            TextField("Your answer", text: $answerAmount).keyboardType(.numberPad)
            
            Button(action: {
                self.answerQuestion()
            }) {
                Text("Answer")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), primaryButton: .default(Text("Next")) {
                    self.nextQuestion()
                    }, secondaryButton: .cancel(Text("End Game")) {
                        self.callback()
                    })
            }
        }.padding()
    }
    
    private func answerQuestion() {
        if let number = Int(answerAmount)  {
            if number == questions[currentQuestion].answer {
                score += 1
                correctNumber += 1
                alertTitle = "Correct!"
                alertMessage = "Your score: \(score).\n You have \(correctNumber) correct answers per \(numberQuestion)"
            } else {
                score -= 1
                alertTitle = "Wrong!"
                alertMessage = "Your score: \(score).\n You have \(correctNumber) correct answers per \(numberQuestion)"
            }
        } else {
            score -= 1
            alertTitle = "Wrong!"
            alertMessage = "Your score: \(score).\n You have \(correctNumber) correct answers per \(numberQuestion)"
        }
        
        showAlert = true
        
    }
    
    private func nextQuestion() {
        if currentQuestion < numberQuestion - 1 {
            currentQuestion += 1
        }
        showAlert = false
        answerAmount = ""
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(questions: [Question(text: "4 x 9", answer: 36)],  numberQuestion: 10) {
        }
    }
}
