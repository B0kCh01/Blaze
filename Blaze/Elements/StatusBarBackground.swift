//
//  StatusBg.swift
//  Blaze
//
//  Created by Nathan Choi on 9/20/20.
//

import SwiftUI

struct StatusBarBackground: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Color(.systemBackground)
                    .frame(height: geo.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.top)
                Spacer()
            }
        }
    }
}
