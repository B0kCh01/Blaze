//
//  NewsView.swift
//  Blaze
//
//  Created by Nathan Choi on 8/31/20.
//

import SwiftUI
import ModalView

struct NewsView: View {
    @EnvironmentObject var news: NewsBackend
    
    var body: some View {
        ModalPresenter {
            if news.loaded {
                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Header(title: "News", desc: "Latest national news and updates issued by the Incident Information System.")
                            Spacer()
                        }
                            .padding(.vertical, 20)

                        ForEach(news.newsList) { news in
                            ModalLink(destination: { WebModal(dismiss: $0, url: news.url) }) {
                                NewsCard(news: news)
                            }
                        }
                    }
                }
            } else {
                ProgressView("Loading Stories...")
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
