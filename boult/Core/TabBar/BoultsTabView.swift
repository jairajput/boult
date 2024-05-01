//
//  BoultsTabView.swift
//  boult
//
//  Created by Jai  on 19/01/24.
//

import SwiftUI

struct BoultsTabView: View {
    @State private var selectedTab = 0
    @State private var showCreateBoultView = false
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    @State private var modelData = ModelData()


    
    
    var body: some View {
        TabView(selection: $selectedTab) {
        FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            NewsScreen()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "newspaper.fill" : "paperplane.fill")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
            TouchdownContentView()
                .environmentObject(Shop())// New tab
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Shopping")
                }
                .onAppear { selectedTab = 5 }
                .tag(5)

            HomeView()
                .environmentObject(HomeViewModel())// New tab
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Crypto")

                }
                .onAppear { selectedTab = 6 }
                .tag(6)
            
            PortfolioView()
                .environmentObject(HomeViewModel())
                .tabItem {
                    Image(systemName: "dollarsign.arrow.circlepath")
                    Text("Portfolio")

                }
                .onAppear { selectedTab = 7}
                .tag(7)
            
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }

                .environmentObject(ScrumStore())
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Community")

                }
                .onAppear { selectedTab = 8}
                .tag(8)
            LandMarkContentView()
                .environment(modelData)
                .tabItem {
                    Image(systemName: "figure.walk.motion")
                    Text("Go to Your Fav Place Join People")

                }
                .onAppear { selectedTab = 9 }
                .tag(9)

            
            
        }
        
        .onChange(of: selectedTab, perform: { newValue in
            showCreateBoultView = selectedTab == 2
        })
        .sheet(isPresented: $showCreateBoultView, onDismiss: {
            selectedTab = 0
        }, content: {
            CreateBoultView()
        })
        .tint(.black)
    }
}

#Preview {
    BoultsTabView()
}
