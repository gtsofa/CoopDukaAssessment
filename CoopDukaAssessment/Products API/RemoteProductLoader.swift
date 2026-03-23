//
//  RemoteProductLoader.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import Foundation

public class RemoteProductLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadProductsResult
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case let .success((data, response)):
                do {
                    let items = try ProductItemsMapper.map(data, from: response)
                    completion(.success(items))
                } catch {
                    completion(.failure(RemoteProductLoader.Error.invalidData))
                }
            case .failure:
                completion(.failure(RemoteProductLoader.Error.connectivity))
            }
        }
    }
}
