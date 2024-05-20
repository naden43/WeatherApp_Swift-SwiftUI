//
//  BackBtn.swift
//  WeatherApp
//
//  Created by Naden on 18/05/2024.
//

import SwiftUI

struct BackBtn: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button {
            
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "gobackward").padding()
        }
    }
}

#Preview {
    BackBtn()
}
