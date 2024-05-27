//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct CurrentWeatherDataView: View {
    
    var currentData : Current?
    var location : Location?
    var dayForecast : Forecastday?
    var dataIsDark : Bool?
    var body: some View {
        
        VStack{
            Text(location?.name ?? "").foregroundColor((dataIsDark ?? false) ? .black : .white).fontWeight(.bold)
                .font(.largeTitle)//.foregroundColor()
            Text("\(Int(currentData?.tempC  ?? 0)) \u{00B0}").foregroundColor((dataIsDark ?? false) ? .black : .white).fontWeight(.bold)
                .font(.largeTitle)
            Text(currentData?.condition?.text ?? "clear").foregroundColor((dataIsDark ?? false) ? .black : .white)
                .font(.largeTitle)
            
            HStack{
                Text("H: \(Int(dayForecast?.day?.maxtempC ?? 0 ))  \u{00B0}").foregroundColor((dataIsDark ?? false) ? .black : .white).padding(.trailing , 5).font(.title)
                Text("L: \(Int(dayForecast?.day?.mintempC ?? 0))  \u{00B0}").foregroundColor((dataIsDark ?? false) ? .black : .white).font(.title)
            }
            
            let url = URL(string: "https:\(currentData?.condition?.icon ?? "")")
            
           
            KFImage(url).resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 75, height: 75)
            
            //Image("cloudy").resizable().frame(width: 75 , height: 75)
                        
            
        }
        
    }
}

#Preview {
    CurrentWeatherDataView()
}
