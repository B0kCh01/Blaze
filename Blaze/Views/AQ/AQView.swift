//
//  AQView.swift
//  Blaze
//
//  Created by Paul Wong on 9/9/20.
//

import SwiftUI

struct AQView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                AQMeter(level: "Moderate", aqi: "100")
                    .padding(.vertical, 45)
                
                
                Header(title: "Air Quality", desc: "Today’s air quality level is high. The US Forest Service is in unified command with CAL FIRE onthe Elkhorn Fire.")
                    .padding(.bottom, 20)
                
                AQCard(date: "Today", ozone: "21", ozoneCaption: "Good. Enjoy your outdoor activities.", primaryPollutant: "2.5", primaryPollutantCaption: "Restrain from going outdoors.")
            }
            .padding(.bottom, 20)
        }
    }
}

struct AQView_Previews: PreviewProvider {
    static var previews: some View {
        AQView()
    }
}
