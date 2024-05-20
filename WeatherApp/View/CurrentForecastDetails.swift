//
//  CurrentForecastDetails.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI

struct CurrentForecastDetails: View {
    
    private let adaptiveColumn = [
            GridItem(.adaptive(minimum: 150))
        ]

    var forecastData : Current?
    var body: some View {
        LazyVGrid(columns: adaptiveColumn, spacing: 40){
            
            VStack{
                Text("VISABILITY").font(.callout).padding().foregroundColor(.gray)
                Text("\(Int(forecastData?.visKM ?? 0)) Km").font(.title2)
            }
            
            VStack{
                Text("HUMIDITY").font(.callout).padding().foregroundColor(.gray)
                Text("\(Int(forecastData?.visKM ?? 0)) %").font(.title2)
            }
            
            VStack{
                Text("FEELSLIKE").font(.callout).padding().foregroundColor(.gray)
                Text("\(Int(forecastData?.feelslikeC ?? 0)) \u{00B0}").font(.title2)
            }
            
            VStack{
                Text("PRESSURE").font(.callout).padding().foregroundColor(.gray)
                Text("\(Int(forecastData?.pressureMB ?? 0))").font(.title2)
            }
        }
    }
}

#Preview {
    CurrentForecastDetails()
}
