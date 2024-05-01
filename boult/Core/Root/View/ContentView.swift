//
//  ContentView.swift
//  boult
//
//  Created by Jai  on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                BoultsTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
