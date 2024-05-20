//
//  DetailsForecastScreen.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI
import CoreLocation

struct DetailsForecastScreen: View {
    
    @ObservedObject var viewModel  = HomeViewModel(networkHandler: NetworkHandler.instance, manager: CLLocationManager())
    
    var dayForecast : Forecastday?
    var body: some View {
        
        HourlyFourcastList(forecastList: dayForecast)
    }
}

#Preview {
    DetailsForecastScreen()
}
