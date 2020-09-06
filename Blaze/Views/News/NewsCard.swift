//
//  NewsCard.swift
//  Blaze
//
//  Created by Nathan Choi on 8/31/20.
//

import SwiftUI
import URLImage

struct NewsCard: View {
    var news: News
    
    var body: some View {
        VStack(spacing: 0) {
            if let url = URL(string: news.coverImage) {
                ZStack(alignment: .topLeading) {
                    URLImage(url,
                             placeholder: {_ in Color.accentColor.aspectRatio(contentMode: .fill)},
                             failure: {_ in Color.accentColor.aspectRatio(contentMode: .fill)}
                    ) { proxy in
                        proxy.image.renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                        .animation(.easeOut)
                        .frame(width: UIScreen.main.bounds.maxX-40, height: 220)
                        .clipped()
                    
                    Text(news.getTimeAgo().uppercased())
                        .fontWeight(.bold)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
                        .padding(10)
                }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(news.id)
                        .foregroundColor(.primary)
                        .font(.title)
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: false, vertical: true)
                    (Text(news.publisher)
                        .foregroundColor(.accentColor)
                    + Text(" • " + news.author)
                        .foregroundColor(.secondary)
                    )
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            }.padding(20)
        }
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .padding([.bottom, .horizontal], 20)
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        let news = News(id: "Paul is stuck in anime, still stuck.",
                        author: "Paul Wong",
                        authorImg: "https://assets3.thrillist.com/v1/image/2855068/1200x630",
                        authorBio: "Is an anime lover",
                        content: "# Markdown Support\n---\n * Yessir\n\n<p style='color: orange'>HTML Support</p>",
                        coverImage: "https://arc-anglerfish-arc2-prod-tbt.s3.amazonaws.com/public/BWRGAGGQUFAD5H6BQ2VRVKF6ZE.jpg",
                        publisher: "Fox News",
                        sourceURL: "https://quick-mass.netlify.app",
                        date: Date(timeIntervalSinceNow: .pi))
        return NewsCard(news: news)
    }
}
