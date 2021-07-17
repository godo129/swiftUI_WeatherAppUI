//
//  ContentView.swift
//  WeatherApp
//
//  Created by hong on 2021/07/18.
//

import SwiftUI

struct ContentView: View {
    
    // 다크모드 판단 기준

    @State private var isNight = false
    
    var body: some View {
        
        ZStack {
            
            // 배경 처리 , UI처리 , 바인딩 해 주었기 때문에 $를 변수 앞에 붙여야함
            BackgroundView(isNight: $isNight)
            
            
            
            VStack {
                
                // 텍스트 처리
                CityTextView(cityName: "Cupertino, CA")
                
                
                // 이미지 처리, sf symbol 이용
                MainWeatherStatusView(imageName: isNight ? "moon.fill" : "sun.max.fill",
                                      temperature: 78)
                
                    .padding(.bottom, 20)
               
                
                HStack(spacing: 20){
                    
                    // 요일별 처리
                    weatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    weatherDayView(dayOfWeek: "Wed",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 68)
                    
                    weatherDayView(dayOfWeek: "Thu",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 72)
                    
                    weatherDayView(dayOfWeek: "Fri",
                                   imageName: "cloud.sleet.fill",
                                   temperature: 60)
                    
                    weatherDayView(dayOfWeek: "Sat",
                                   imageName: "snowflake",
                                   temperature: 64)
                    
                    
                }
                
                Spacer()
                
                Button {
                    
                    // 상태 변경 해줌
                    isNight.toggle()
     
                } label: {
                    
                    // 따로 버튼 관련한 UI 파일 만들어 줌
                    WeatherButton(buttonText: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
          
            }

        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// 요일별 온도, 이미지 리팩터링

struct weatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

// 뒷 배경 리팩터링
struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),                startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    
    var cityName: String
    
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
            
    }

}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(spacing: 10) {
        
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 40)
        
        
    }
    
}

