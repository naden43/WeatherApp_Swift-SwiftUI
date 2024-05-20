//
//  ThreeDaysForcastRow.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct ThreeDaysForcastRow: View {
    
    var forcastDayData : Forecastday?
    
    var body: some View {
        
        HStack{
            Text(forcastDayData?.litrealDate ?? "")
            
            Spacer()
            
            let url = URL(string: "https:\(forcastDayData?.day?.condition.icon ?? "")")
            
           
            KFImage(url).resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 34, height: 34)
            Spacer()
            Text("\(Int(forcastDayData?.day?.mintempC ?? 0 )) \u{00B0} -  \(Int(forcastDayData?.day?.maxtempC ?? 0 )) \u{00B0} ")
        }.listRowBackground(Color.clear)

    }
}




#Preview {
    ThreeDaysForcastRow()
}
