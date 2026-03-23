//
//  HTTPClient.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
