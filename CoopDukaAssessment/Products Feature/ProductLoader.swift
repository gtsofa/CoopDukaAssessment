//
//  ProductLoader.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import Foundation

public enum LoadProductsResult {
    case success([ProductItem])
    case failure(Error)
}

protocol ProductLoader {
    func load(completion: @escaping (LoadProductsResult) -> Void)
}
