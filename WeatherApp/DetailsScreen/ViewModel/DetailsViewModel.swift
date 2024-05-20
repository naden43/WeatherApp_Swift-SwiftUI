//
//  DetailsViewModel.swift
//  WeatherApp
//
//  Created by Naden on 19/05/2024.
//

import Foundation

class DetailsViewModel : ObservableObject {
    
    @Published var dayForecast : Forecastday?
    
    
    init(dayForecast: Forecastday) {
        self.dayForecast = dayForecast
    }
    
    
    
}
