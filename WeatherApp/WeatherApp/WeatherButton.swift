//
//  WeatherButton.swift
//  WeatherButton
//
//  Created by hong on 2021/07/18.
//

import SwiftUI


struct WeatherButton: View {
    
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
        
        
    }
}
