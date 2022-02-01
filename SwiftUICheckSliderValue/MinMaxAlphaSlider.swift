//
//  MinMaxAlphaSlider.swift
//  SwiftUICheckSliderValue
//
//  Created by Михаил Зиновьев on 01.02.2022.
//

import SwiftUI

struct MinMaxAlphaSlider: View {
    @Binding var currentValue: Float
    @Binding var thrumbAlpha: CGFloat
    
    private let minValue: Float = 0.0
    private let maxValue: Float = 100.0
    
    var body: some View {
        HStack (spacing: 10) {
            Text("\(Int(minValue))")
                .padding(.leading, 20)
            AlphaSlider(minValue: minValue, maxValue: maxValue, currentValue: $currentValue, thrumbAlpha: $thrumbAlpha)
            Text("\(Int(maxValue))")
                .padding(.trailing, 20)
        }.onAppear{
            currentValue = Float.random(in: minValue...maxValue)
        }
    }
}

struct MinMaxAlphaSlider_Previews: PreviewProvider {
    static var previews: some View {
        MinMaxAlphaSlider(currentValue: .constant(50), thrumbAlpha: .constant(50))
    }
}

