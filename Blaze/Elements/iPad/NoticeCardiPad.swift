//
//  NoticeCardiPad.swift
//  Blaze
//
//  Created by Paul Wong on 11/2/20.
//

import SwiftUI

struct NoticeCardiPad: View {
    
    private var title: String
    private var text: String
    
    init(title: String = "1.0", text: String = "Placeholder") {
        self.title = title
        self.text = text
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(Image(systemName: "exclamationmark.triangle.fill")) \(title)")
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text(text)
                    .font(.callout)
                    .foregroundColor(Color.secondary)
            }
            Spacer()
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(20)
        .background(Color(.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .padding(.horizontal, 20)
    }
}
