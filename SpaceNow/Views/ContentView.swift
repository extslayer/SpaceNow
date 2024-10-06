//
//  ContentView.swift
//  SpaceNow
//
//  Created by Manmohan Shrivastava on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = SpaceAPI()
    @State private var opac = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                
                NewsView()
                    .opacity(opac)
                   
            }
            .environmentObject(data)
            .onAppear {
                data.getData()
                withAnimation(.easeIn(duration: 2)){
                    opac = 1.0
                }
            }
            .navigationTitle("Space Now")
            .padding(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
