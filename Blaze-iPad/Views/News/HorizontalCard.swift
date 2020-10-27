//
//  HorizontalCard.swift
//  Blaze-iPad
//
//  Created by Paul Wong on 10/26/20.
//

import SwiftUI

struct HorizontalCard: View {
    @State private var show = false
    
    private var title: String
    private var subtitle: String
    
    init(newsObject: News, subtitle: String) {
        self.title = newsObject.id
        self.subtitle = subtitle
    }
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(subtitle)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(20)
        .background(Color(.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .padding(.horizontal, 20)
    }
}