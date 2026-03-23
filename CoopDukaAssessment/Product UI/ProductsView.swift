//
//  ProductsView.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import SwiftUI

struct ProductsView: View {
    @StateObject var viewModel: ProductViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            if viewModel.isLoading {
                ProgressView()
                    .padding(.top, 8)
            }
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
            
            List(viewModel.products, id: \.id) { product in
                productRow(product)
            }
        }
    }
    
    private func productRow(_ product: ProductItem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                
                Text("KES 600.00")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}
