//
//  Settings.swift
//  Blaze
//
//  Created by Paul Wong on 9/7/20.
//

import SwiftUI
import ModalView

struct Settings: View {
    @AppStorage("welcomed") var welcomed = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Header(title: "Settings", desc: "The US Forest Service is in unified command with CAL FIRE on the Elkhorn Fire.")
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                UnitsCard(title: "Units", desc: "Change the units of the fire spread area.")
                SettingsCard(title: "FAQ", desc: "Provides information about Blaze.")
                NavigationLink(destination: CreditsView()) {
                    SettingsCard(title: "Credits", desc: "See people who have contributed in this project.")
                }
                
                // TODO: Create the UI
                Toggle("Show Splash Screen", isOn: !$welcomed)
                    .padding(20)
            }
        }.navigationBarTitle("", displayMode: .inline)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}