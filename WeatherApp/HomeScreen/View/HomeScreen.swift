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
        if viewModel.isConnected == true {
            NavigationView{
                VStack{
                    
                    CurrentWeatherDataView(currentData: viewModel.weatherData?.current, location: viewModel.weatherData?.location , dayForecast: viewModel.weatherData?.forecast?.forecastday?[0] , dataIsDark: viewModel.isDark)
                    
                    ThreeDaysForecastList(forecastDays: viewModel.weatherData?.forecast?.forecastday , backgroundImage: viewModel.backgoundImageName , dataIsDark: viewModel.isDark)
                    CurrentForecastDetails(forecastData: viewModel.weatherData?.current , dataIsDark: viewModel.isDark)
                    Spacer()
                    Spacer()
                    
                }.padding(.top , 34).background(Image(viewModel.backgoundImageName))
            }.ignoresSafeArea().tint(.white)
        }
        else{
        
            VStack{
                Text("No Internet Connection")
                //Image("global").resizable().frame(width: 100 , height: 100)
            }
        }
    }
}


#Preview {
    HomeScreen()
}
