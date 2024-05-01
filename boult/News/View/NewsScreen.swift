//
//  NewsScreen.swift
//  boult
//
//  Created by Jai  on 29/04/24.
//

import SwiftUI

struct NewsScreen: View {
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
                    
                    withAnimation(.easeIn(duration: 2)) {
                        opac = 1.0
                    }
                }
                .navigationTitle("News")
            }
        }
    }
#Preview {
    NewsScreen()
}
