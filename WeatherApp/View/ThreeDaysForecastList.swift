//
//  ThreeDaysForecastList.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI

struct ThreeDaysForecastList: View {
    
    var forecastDays : [Forecastday]?
    var body: some View {
        //NavigationView{
        List{
                Section{
                    
                    ForEach(forecastDays ?? [], id: \.date) { forecastDay in
                        NavigationLink(destination: DetailsForecastScreen(dayForecast: forecastDay)){
                            ThreeDaysForcastRow(forcastDayData: forecastDay)
                        }.listRowBackground(Color.clear)
                    }
                } header: {
                    Text("3 Days Forecast").bold().font(.subheadline)
                }
            }.scrollDisabled(true).scrollContentBackground(.hidden)
       // }.scrollContentBackground(.hidden).listRowBackground(Color.clear).background(Color.clear)

    }
}

/*#Preview {
    ThreeDaysForecastList()
}*/
