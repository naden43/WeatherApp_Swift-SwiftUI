//
//  HourlyFourcastList.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI

struct HourlyFourcastList: View {
    
    var forecastList : Forecastday?
    var dataIsDark : Bool?
    var body: some View {
        
        List(forecastList?.hour ?? [] , id: \.time){ item in
            HourForeastRow(dayForecast: item , dataIsDark: dataIsDark)
            
            
        }.scrollContentBackground(.hidden)
    }
}

#Preview {
    HourlyFourcastList()
}
