//
//  CoopDukaAssessmentApp.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import SwiftUI

@main
struct CoopDukaAssessmentApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    let remoteLoader: RemoteProductLoader
    
    init() {
        let remoteURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let client = URLSessionHTTPClient()
        self.remoteLoader = RemoteProductLoader(url: remoteURL, client: client)
    }
    
    var body: some Scene {
        WindowGroup {
            
            if isLoggedIn {
                NavigationStack {
                    ProductsView(viewModel: ProductViewModel(loader: remoteLoader))
                }
            } else {
                LoginView()
            }
        }
    }
}
