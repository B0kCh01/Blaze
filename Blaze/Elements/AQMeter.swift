//
//  AQMeter.swift
//  Blaze
//
//  Created by Paul Wong on 9/9/20.
//

import SwiftUI

struct AQMeter: View {
    var airQ: AirQuality
    
    var body: some View {
        VStack(spacing: 10) {
            if String(airQ.AQI) == "-1" {
                ProgressView()
            } else {
                Text(airQ.category.Name)
                    .font(airQ.category.Name.count > 10 ? .callout : .largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                (Text(String(airQ.AQI)) + Text(" AQI"))
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
                    .transition(.opacity)
                    .animation(.easeInOut)
            }
        }
        .foregroundColor(.white)
        .padding(85)
        .animation(.spring())
        .background(determineColor(cat: airQ.category.Number))
        .clipShape(Circle())
    }
}


func determineColor(cat: Int) -> Color {
    switch (cat) {
    case 1:
        return Color.green
    case 2:
        return Color.yellow
    case 3:
        return Color.red
    case 4:
        return Color.purple
    default:
        return Color.blaze
    }
}

struct AQMeter_Previews: PreviewProvider {
    static var previews: some View {
        AQMeter(airQ: AirQuality())
    }
}
