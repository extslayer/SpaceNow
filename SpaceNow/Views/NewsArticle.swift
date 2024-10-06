//
//  NewsArticle.swift
//  SpaceNow
//
//  Created by Manmohan Shrivastava on 06/10/24.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    let title: String
    let imageurl: String
    let sitename: String
    let summary: String
    var body: some View {
        VStack(alignment: .leading){
            
            
            HStack{
                CachedAsyncImage(url: URL(string:imageurl),
                                 transaction: Transaction(animation: .easeInOut)){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity)
                    } else{
                        HStack{
                            ProgressView()
                        }
                        
                    }
                    
                }
            }
            
            Text(sitename)
                .font(.subheadline)
                .padding(.horizontal)
                .padding(.top)
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(8)
            
            
            
        }
    }
}

#Preview {
    NewsArticle(title: "ManmohanTest", imageurl: "https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2024/10/mission_control_go_for_hera_launch/26344256-1-eng-GB/Mission_control_GO_for_Hera_launch_card_full.jpg", sitename: "Manmohantest", summary: "shkbckebckebjcbjkedbcieciuebc")
}
