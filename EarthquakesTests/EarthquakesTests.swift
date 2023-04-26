//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Ly Gia Huy on 25/04/2023.
//

@testable import Earthquakes
import XCTest

final class EarthquakesTests: XCTestCase {
    func testGeoJSONDecoderDecodesQuake() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let quake = try decoder.decode(Quake.self, from: testFeature_nc73649170)

        XCTAssertEqual(quake.code, "73649170")

        let expectedSeconds = TimeInterval(1_636_129_710_550) / 1000
        let decodedSeconds = quake.time.timeIntervalSince1970

        XCTAssertEqual(expectedSeconds, decodedSeconds, accuracy: 0.00001)

        let decodedTsunami = quake.tsunami
        XCTAssertEqual(0, decodedTsunami)
    }

    func testGeoJSONDecoderDecodesGeoJSON() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970

        let geoJSON = try decoder.decode(GeoJSON.self, from: testQuakesData)

        XCTAssertEqual(6, geoJSON.quakes.count)
        XCTAssertEqual("73649170", geoJSON.quakes.first?.code)

        let expectedSeconds = TimeInterval(1_636_129_710_550) / 1000
        let decodedSeconds = geoJSON.quakes.first?.time.timeIntervalSince1970

        XCTAssertEqual(expectedSeconds, decodedSeconds)
    }
}
