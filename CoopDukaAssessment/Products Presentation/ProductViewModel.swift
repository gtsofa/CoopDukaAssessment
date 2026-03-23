//
//  ProductViewModel.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import Foundation
import Combine

@MainActor
class ProductViewModel: ObservableObject {
    @Published private(set) var products = [ProductItem]()
    @Published var isLoading = false
    @Published var errorMessage: String?
    private let loader: ProductLoader
    
    init(loader: ProductLoader) {
        self.loader = loader
    }
    
    func loadProducts() {
        isLoading = true
        errorMessage = nil
        
        loader.load() { [weak self] result in
            guard let self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case let .success(items):
                    self.products = items
                case let .failure(error):
                    self.products = []
                    self.errorMessage = error.localizedDescription
                }
            }
            
        }
    }
    
    func onAppear() {
        loadProducts()
    }
    
}
