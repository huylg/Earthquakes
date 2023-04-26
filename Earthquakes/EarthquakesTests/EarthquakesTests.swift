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

    func testQuakeDetailsDecoder() throws {
        let decoded = try JSONDecoder().decode(QuakeLocation.self, from: testDetail_hv72783692)
        XCTAssertEqual(decoded.latitude, 19.2189998626709)
        XCTAssertEqual(decoded.longitude, -155.434173583984)
    }

    func testClientDoesFetchEarthquakeData() async throws {
        let downloader = TestDownloader()
        let client = QuakeClient(downloader: downloader)
        let quakes = try await client.quakes

        XCTAssertEqual(quakes.count, 6)
    }
}
