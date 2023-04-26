//
//  HTTPDataDownloader.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import Foundation

protocol HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, _) = try? await data(from: url, delegate: nil) else {
            throw QuakeError.networkError
        }
        return data
    }
}
