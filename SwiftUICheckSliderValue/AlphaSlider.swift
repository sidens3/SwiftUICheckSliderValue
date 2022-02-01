//
//  AlphaSlider.swift
//  SwiftUICheckSliderValue
//
//  Created by Михаил Зиновьев on 01.02.2022.
//

import SwiftUI

struct AlphaSlider: UIViewRepresentable {
    @State var currentValue: Int = 0
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.sizeToFit()
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        
    }
}


struct AlphaSlider_Previews: PreviewProvider {
    static var previews: some View {
        AlphaSlider()
    }
}
