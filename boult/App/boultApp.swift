//
//  boultApp.swift
//  boult
//
//  Created by Jai  on 18/01/24.
//
import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}



@main
struct boultApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    @StateObject private var vm = HomeViewModel()
//    @State private var showContentView: Bool = true
//    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
//        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
//        UITableView.appearance().backgroundColor = UIColor.clear
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            ZStack {
//                NavigationView {
//                    mainTabView()
//                        .navigationBarHidden(true)
//                }
//                .navigationViewStyle(StackNavigationViewStyle())
//                .environmentObject(vm)
//
//                ZStack {
//                    if showContentView {
//                        CryptoContentView(showContentView: $showContentView)
//                            .transition(.move(edge: .leading))
//                    }
//                }
//                .zIndex(2.0)
//            }
        }
    }
}
