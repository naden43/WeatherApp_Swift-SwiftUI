//
//  HomeScreen.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI
import CoreLocation

struct HomeScreen: View {
    
    @ObservedObject var viewModel : HomeViewModel = HomeViewModel(networkHandler: NetworkHandler.instance , manager: CLLocationManager())
    
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                CurrentWeatherDataView(currentData: viewModel.weatherData?.current, location: viewModel.weatherData?.location , dayForecast: viewModel.weatherData?.forecast?.forecastday?[0])
                
                ThreeDaysForecastList(forecastDays: viewModel.weatherData?.forecast?.forecastday)
                CurrentForecastDetails(forecastData: viewModel.weatherData?.current)
                Spacer()
                Spacer()
                
            }.padding(.top , 34).background(Image("Day"))
        }.ignoresSafeArea().tint(.white)
        
    }
}


#Preview {
    HomeScreen()
}
