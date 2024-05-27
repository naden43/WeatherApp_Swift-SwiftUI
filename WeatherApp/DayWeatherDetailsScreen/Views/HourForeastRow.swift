//
//  HourForeastRow.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct HourForeastRow: View {
    
    var dayForecast : Hour?
    var dataIsDark : Bool?
    var body: some View {
        
        HStack{
            Text("\(dayForecast?.time ?? "00:00")").font(.title).foregroundColor((dataIsDark ?? false) ? .black : .white).bold()
            Spacer()
            let url = URL(string: "https:\(dayForecast?.condition?.icon ?? "")")
            
           
            KFImage(url).resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 75, height: 75)
            
            Spacer()
            
            Text("\(Int( dayForecast?.tempC ?? 0 ))  \u{00B0}").font(.title).foregroundColor((dataIsDark ?? false) ? .black : .white).bold()
        }.padding(.trailing , 4).padding(.leading , 4).listRowBackground(Color.clear)
    }
}

#Preview {
    HourForeastRow()
}
