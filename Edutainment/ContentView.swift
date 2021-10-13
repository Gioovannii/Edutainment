//
//  ContentView.swift
//  Edutainment
//
//  Created by Giovanni Gaffé on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    @State private var multiplicationTable = 1
    @State private var questionSelection = 1
    let questions = ["5", "10", "20", "All"]
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
