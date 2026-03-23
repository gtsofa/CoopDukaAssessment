//
//  CoopDukaAssessmentApp.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import SwiftUI

@main
struct CoopDukaAssessmentApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    
    private let remoteLoader: RemoteProductLoader
    private let viewModel: ProductViewModel
    
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com")!
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
                LoginView()
            }
        }
    }
}

