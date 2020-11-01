//
//  MiniFireCard.swift
//  Blaze-iPad
//
//  Created by Paul Wong on 10/26/20.
//

import SwiftUI

struct MiniFireCard: View {
    @AppStorage("areaUnits") var areaUnits: String = currentUnit ?? units[0]
    
    var selected: Bool
    var fireData: ForestFire
    var area: Bool
        
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(systemName: "flame")
                .font(.system(size: 26))
                .padding(.bottom, 10)
                .foregroundColor(.secondary)
            Text(fireData.name)
                .font(.system(size: fireData.name.count > 30 ? 18 : 24))
                .fontWeight(.medium)
                .foregroundColor(.primary)
            
            Spacer()
            HStack {
                Text(area ? fireData.getAreaString(areaUnits) : fireData.updated.getElapsedInterval() + " ago")
                    .font(.system(size: fireData.getAreaString(areaUnits).count > 14 ? 16 : 17))
                    .fontWeight(.regular)
                    .foregroundColor(.blaze)
                Spacer()
                
                NavigationLink(destination: FireMapView(fireData: fireData)) {
                    RoundedButton("MAP")
                }
            }
        }
        .padding(15)
        .frame(width: 220, height: 180)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct MiniFireCard_Previews: PreviewProvider {
    static var previews: some View {
        let fire = ForestFire(
            name: "Elkhorn Fire",
            location: "Lake Hughes Rd and Prospect Rd, southwest Lake Hughes",
            counties: ["Los Angeles"],
            latitude: 34.679402,
            longitude: -118.451917,
            acres: 45340,
            contained: 58,
            relURL: "/incidents/2020/8/12/lake-fire/"
        )

        NavigationView {
            MiniFireCard(selected: true, fireData: fire, area: true)
        }
        .padding(15)
        .frame(width: 230, height: 190)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}