//
//  ContentView.swift
//  WeSplit
//
//  Created by Prakash Radhakrishnan on 03/08/20.
//  Copyright © 2020 Prakash Radhakrishnan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //        Step 2:
    //    @State private var tapCount = 0
    
    //    Step 3:
//    @State private var name = ""
    
//    Step 4-1:
//    let students = ["Harry", "Jhon", "Ron"]
//    @State private var selectedStudent = "Jhon"
    
    //        Step 5:
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 15, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grantTotal = orderAmount - tipValue
        let amountPerPerson = grantTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        //        Step 1:
        
        //        NavigationView {
        //            Form {
        //                Section {
        //                    Text("Hello, World!")
        //
        //                }
        //
        //            }
        //            .navigationBarTitle("SwiftUI")
        //        }
        
        //        Step 2:
        
        //        Button("Tap Count: \(tapCount)"){
        //            self.tapCount += 1
        //
        //        }
        
        //    Step 3:
//        Form {
//
//            TextField("Enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
//        Step 4-0:
//        Form {
//            ForEach(0 ..< 100){
//                Text("Row \($0)")
//            }
//        }
        
        //    Step 4-1:
//        Picker("Select your student", selection: $selectedStudent){
//            ForEach(0 ..< students.count){
//                Text(self.students[$0])
//            }
//        }
        
//        Step 5:
        NavigationView{
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    
//                    Text("How much tip do you want to leave?")
                    
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
