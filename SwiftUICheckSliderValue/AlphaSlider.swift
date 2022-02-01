//
//  AlphaSlider.swift
//  SwiftUICheckSliderValue
//
//  Created by Михаил Зиновьев on 01.02.2022.
//

import SwiftUI

struct AlphaSlider: UIViewRepresentable {
    let minValue: Float
    let maxValue: Float
    
    @State var currentValue: Float = 50
    @State var thrumbAlpha = Float.random(in: 0...100)
    
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.sizeToFit()
        
        slider.value = Float.random(in: 0...100)
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        slider.isContinuous = true

        slider.thumbTintColor = .blue.withAlphaComponent(CGFloat(currentValue / 100))
        slider.addTarget(context.coordinator, action: #selector(Coordinator.sliderValueDidChange(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ slider: UISlider, context: Context) {
        DispatchQueue.main.async {
            currentValue = slider.value
            slider.thumbTintColor = .blue.withAlphaComponent(CGFloat(currentValue / 100.0))
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension AlphaSlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValueDidChange(_ sender: UISlider) {
            currentValue = sender.value
        }
    }
}


struct AlphaSlider_Previews: PreviewProvider {
    static var previews: some View {
        AlphaSlider(minValue: 0.0, maxValue: 100.0)
    }
}
