//
//  MonitoringListView.swift
//  Blaze
//
//  Created by Paul Wong on 11/3/20.
//

import SwiftUI

struct MonitoringListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Hello World")
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 20)
        }
        .navigationBarTitle("Monitoring List", displayMode: .large)
        .navigationBarItems(
            trailing: Button(action: {}) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 25))
            }
        )
    }
}
