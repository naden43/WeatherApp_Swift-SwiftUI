//
//  HourlyFourcastList.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI

struct HourlyFourcastList: View {
    
    var forecastList : Forecastday?
    
    var body: some View {
        
        List(forecastList?.hour ?? [] , id: \.time){ item in
            /*HourForeastRow()
            HourForeastRow()
            HourForeastRow()
            HourForeastRow()
            HourForeastRow()*/
            HourForeastRow(dayForecast: item)
            
            
        }.scrollContentBackground(.hidden).background(Image("Day"))
    }
}

#Preview {
    HourlyFourcastList()
}
