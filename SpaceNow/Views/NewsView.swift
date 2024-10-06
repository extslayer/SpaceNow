//
//  NewsView.swift
//  SpaceNow
//
//  Created by Manmohan Shrivastava on 06/10/24.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var data : SpaceAPI
    @Environment(\.openURL) var openURL
    private var textwidth = 300.0
    
    var body: some View {
        List{
            ForEach(data.news){ news in
                NewsArticle(title: news.title, imageurl: news.image_url, sitename: news.news_site, summary: news.summary)
                    .onTapGesture {
                        openURL(URL(string: news.url)!)
                    }
                
            }
        }
        .refreshable {
            data.getData()
        }
    }
}

#Preview {
    NewsView()
        .environmentObject(SpaceAPI())
}
