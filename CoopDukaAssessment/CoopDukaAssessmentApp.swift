//
//  CoopDukaAssessmentApp.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import SwiftUI

//@main
//struct CoopDukaAssessmentApp: App {
//    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
//    let remoteLoader: RemoteProductLoader
//    
//    init() {
//        let remoteURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//        let client = URLSessionHTTPClient()
//        self.remoteLoader = RemoteProductLoader(url: remoteURL, client: client)
//    }
//    
//    var body: some Scene {
//        WindowGroup {
//            
//            if isLoggedIn {
//                NavigationStack {
//                    ProductsView(viewModel: ProductViewModel(loader: remoteLoader))
//                }
//            } else {
//                LoginView()
//            }
//        }
//    }
//}

@main
struct CoopDukaAssessmentApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    // Dependencies
    private let remoteLoader: RemoteProductLoader
    private let viewModel: ProductViewModel
    
    init() {
        // Initialize dependencies properly before 'self' is used
        let url = URL(string: "https://jsonplaceholder.typicode.com")!
        let client = URLSessionHTTPClient()
        let loader = RemoteProductLoader(url: url, client: client)
        
        self.remoteLoader = loader
        // Pre-initialize the ViewModel so it's ready for the view switch
        self.viewModel = ProductViewModel(loader: loader)
    }
    
    var body: some Scene {
        WindowGroup {
            // Switch between views based on state
            if isLoggedIn {
                NavigationStack {
                    ProductsView(viewModel: viewModel)
                }
            } else {
                LoginView()
            }
        }
    }
}

