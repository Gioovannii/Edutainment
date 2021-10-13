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
    
    let questions = ["5", "10", "20", "All"]
    
    var body: some View {
        NavigationView {
            Form {
                Group {
                    Section(header: Text("How many questions ?")) {
                        Picker("Questions amount", selection: $questionSelection) {
                            ForEach(0 ..< questions.count) {
                                Text("\(self.questions[$0])")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(header: Text("Which multiplication table ?")) {
                        Stepper(value: $multiplicationTable, in: 1...12) {
                            Text("Multiplication table \(multiplicationTable)")
                        }
                        .animation(.default)
                    }
                }
            }
            .navigationBarTitle("Edutainment")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
