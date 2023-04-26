//
//  QuakeClient.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import Foundation

class QuakeClient {
    var quakes: [Quake] {
        get async throws {
            let data = try await downloader.httpData(from: feedURL)
            let quakes = try decoder.decode(GeoJSON.self, from: data).quakes
            return quakes
        }
    }

    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()

    private let feedURL = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")!

    private let downloader: any HTTPDataDownloader

    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
