//
//  APIclient.swift
//  SpaceNow
//
//  Created by Manmohan Shrivastava on 06/10/24.
//
// API: https://api.spaceflightnewsapi.net/v4/articles/

import Foundation

// SpaceData struct to represent each article
struct SpaceData: Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var image_url: String  // Optional to handle missing image URLs
    var news_site: String
    var summary: String
    var published_at: String
}

// Wrapper struct for the API response
struct SpaceAPIResponse: Codable {
    var results: [SpaceData]
}

@MainActor
class SpaceAPI: ObservableObject {
    @Published var news: [SpaceData] = []
    
    func getData() {
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v4/articles?_limit=10") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response Status Code: \(httpResponse.statusCode)")
            }
            
            // Check if there's data, otherwise return an error object
            guard let data = data else {
                let tempError = error?.localizedDescription ?? "Unknown error"
                DispatchQueue.main.async {
                    let emptyResponse = SpaceAPIResponse(results: [SpaceData(id: 0, title: tempError, url: "Error", image_url: "error", news_site: "Error", summary: "Try swiping down to refresh as soon as you have internet again.", published_at: "Error")])
                            self.news = emptyResponse.results // Assign the results array to 'news'
                }
                return
            }
            
            // Print the raw data to check the response
            if let rawString = String(data: data, encoding: .utf8) {
                print("Response Data:")
            }

            do {
                // Decode the top-level response object
                let spaceAPIResponse = try JSONDecoder().decode(SpaceAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    print("Loaded new data successfully! Articles: \(spaceAPIResponse.results.count)")
                    self.news = spaceAPIResponse.results
                }
            } catch {
                print("Decoding error: \(error)")
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, title: "Error loading data", url: "Error", image_url: "error", news_site: "Error", summary: "There was an error loading the data.", published_at: "Error")]
                }
            }
        }.resume()
    }
}
