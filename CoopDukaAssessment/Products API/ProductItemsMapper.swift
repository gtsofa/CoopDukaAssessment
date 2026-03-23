//
//  ProductItemsMapper.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import Foundation

final public  class ProductItemsMapper {
    struct RemoteProductItem: Decodable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
        
        var item: ProductItem {
            return ProductItem(
                userID: userId,
                id: id,
                title: title,
                body: body
            )
        }
    }
    
    
    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [ProductItem] {
        guard response.isOK,
              let remoteItems = try? JSONDecoder().decode([RemoteProductItem].self, from: data) else {
            throw Error.invalidData
        }
        
        return remoteItems.map { $0.item}
    }
}

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
