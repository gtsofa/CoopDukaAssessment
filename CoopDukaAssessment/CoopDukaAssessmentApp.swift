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
    
    private let remoteLoader: RemoteProductLoader
    private let viewModel: ProductViewModel
    
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let client = URLSessionHTTPClient()
        let loader = RemoteProductLoader(url: url, client: client)
        
        self.remoteLoader = loader
        self.viewModel = ProductViewModel(loader: loader)
    }
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                NavigationStack {
                    ProductsView(viewModel: viewModel)
                }
            } else {
                LoginView(didLogin: { credentials in
                    if credentials.username == "admin" && credentials.password == "admin" {
                        isLoggedIn = true
                    }
                })
            }
        }
    }
}

