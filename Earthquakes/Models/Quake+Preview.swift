//
//  Quake+Preview.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 27/04/2023.
//

import Foundation

extension Quake {
    static var sampleQuake: Quake {
        Quake(magnitude: 0.34,
              place: "Shakey Acres",
              time: Date(timeIntervalSinceNow: -1000),
              code: "nc73649170",
              detail: URL(string: "https://example.com")!,
              tsunami: 1,
              location: QuakeLocation(latitude: 38.809_333_8, longitude: -122.796_836_9))
    }
}
