//
//  AQCard.swift
//  Blaze
//
//  Created by Paul Wong on 9/9/20.
//

import SwiftUI

struct AQCard: View {
    var date: String
    var ozone: String
    var ozoneCaption: String
    var primaryPollutant: String
    var primaryPollutantCaption: String
    
    init (ozone: AirQuality, primary: AirQuality){
        self.date = ozone.getDate()
        self.ozone = ozone.category.Name
        self.ozoneCaption = ozone.pollutant
        self.primaryPollutant = primary.category.Name
        self.primaryPollutantCaption = primary.pollutant
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(date)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .opacity(0.5)
                
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Ozone")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                    Text(ozone)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Text(ozoneCaption)
                    .font(.body)
                    .fontWeight(.semibold)
                    .opacity(0.5)
            }
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Particulate Matter")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                    Text(primaryPollutant)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Text(primaryPollutantCaption)
                    .font(.body)
                    .fontWeight(.semibold)
                    .opacity(0.5)
            }
        }
        .padding(15)
        .foregroundColor(.primary)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .padding([.bottom, .horizontal], 20)
    }
}
