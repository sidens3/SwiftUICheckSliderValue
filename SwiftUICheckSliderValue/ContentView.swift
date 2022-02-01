//
//  ContentView.swift
//  SwiftUICheckSliderValue
//
//  Created by Михаил Зиновьев on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue: Int = Int.random(in: 0...100)
    @State var currentValue: Float = 5
    @State var score: Int = 5
    @State var isAlertPresented = false
    
    private let minValue: Float = 0.0
    private let maxValue: Float = 100.0
    private let titleText: String = "Подвинь слайдер, как можно ближе к: "
    
    var body: some View {
        VStack(spacing: 10) {
            Text(titleText + "\(targetValue)")
            HStack (spacing: 10) {
                Text("\(Int(minValue))")
                    .padding(.leading, 20)
                AlphaSlider(minValue: minValue, maxValue: maxValue, currentValue: $currentValue)
                Text("\(Int(maxValue))")
                    .padding(.trailing, 20)
            }
            Button("Проверь меня") {
                checkResult()
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(title: Text("Your Score"),
                      message: Text("\(score)"),
                      dismissButton: .cancel(Text("OK"))
                )
            }
            Button("Начать заново") {
                restart()
            }
        }.onAppear {
            currentValue = Float.random(in: minValue...maxValue)
        }
    }
    
    private func checkResult() {
        print("checkResult")
        isAlertPresented.toggle()
        score = computeScore()
        
    }
    
    private func restart() {
        print("restart")
        targetValue = Int.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
