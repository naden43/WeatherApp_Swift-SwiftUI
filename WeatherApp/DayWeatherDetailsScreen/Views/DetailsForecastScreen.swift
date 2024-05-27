//
//  DetailsForecastScreen.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI
import CoreLocation

struct DetailsForecastScreen: View {
    
    //@EnvironmentObject var viewModel : HomeViewModel
    
    var dayForecast : Forecastday?
    var backgroundImage : String?
    var dataIsDark : Bool?
    var body: some View {
        VStack{
            HourlyFourcastList(forecastList: dayForecast , dataIsDark: dataIsDark)
        }.background(Image(backgroundImage ?? ""))
    }
}

#Preview {
    DetailsForecastScreen()
}
