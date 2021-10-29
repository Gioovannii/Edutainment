//
//  ContentView.swift
//  Edutainment
//
//  Created by Giovanni Gaffé on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    @State private var settingDone = false
    @State private var multiplicationTable = 1
    @State private var questionSelection = 1
    @State private var questions = [Question]()
    
    let numberOfQuestions = ["5", "10", "20", "All"]
    
    var body: some View {
        NavigationView {
            Group {
                if settingDone {
                    GameView(questions: questions, numberQuestion: getNumberQuestion()) {
                        self.settingDone = false
                    }
                } else {
                    Form {
                        Section(header: Text("Which multiplication table ?")) {
                            Stepper(value: $multiplicationTable, in: 1...12) {
                                Text("Multiplication table \(multiplicationTable)")
                            }
                            .animation(.default)
                        }
                        
                        Section(header: Text("How many questions ?")) {
                            Picker("Questions amount", selection: $questionSelection) {
                                ForEach(0 ..< numberOfQuestions.count) {
                                    Text("\(self.numberOfQuestions[$0])")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Section {
                            Button("Start game") {
                                settingDone.toggle()
                                self.generateQuestion()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Edutainment")
        }
    }
    
    
    
    private func generateQuestion() {
        questions = [Question]()
        
        for _ in 1...100 {
            let random1 = Int.random(in: 1...multiplicationTable)
            let random2 = Int.random(in: 1...12)
            
            let question = Question(text: "\(random1) x \(random2)", answer: random1 * random2)
            questions.append(question)
        }
    }
    
    private func getNumberQuestion() -> Int {
        switch questionSelection {
        case 0:
            return 5
        case 1:
            return 10
        case 2:
            return 20
        default:
            return questions.count
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
