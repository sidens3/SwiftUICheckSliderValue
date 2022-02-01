//
//  ContentView.swift
//  SwiftUICheckSliderValue
//
//  Created by Михаил Зиновьев on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue: Int = 50
    //    @Binding var currentValue: Int
    @State var isAlertPresented = false
    
    private let titleText: String = "Подвинь слайдер, как можно ближе к: "
    
    var body: some View {
        VStack(spacing: 10) {
            Text(titleText + "\(targetValue)")
            HStack (spacing: 10) {
                Text("0")
                    .padding(.leading, 20)
                AlphaSlider()
                Text("100")
                    .padding(.trailing, 20)
            }
            Button("Проверь меня") {
                checkResult()
            }
            .alert(isPresented: $isAlertPresented) {
                Alert(title: Text("Your Score"),
                      message: Text("0"),
                      dismissButton: .cancel(Text("OK"))
                )
            }
            Button("Начать заново") {
                restart()
            }
        }
    }
    
    private func checkResult() {
        print("checkResult")
        isAlertPresented.toggle()
    }
    
    private func restart() {
        print("restart")
        targetValue = Int.random(in: 0...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
