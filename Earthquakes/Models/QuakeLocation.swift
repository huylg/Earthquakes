//
//  QuakeLocation.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import Foundation

struct QuakeLocation {
    var latitude: Double { properties.products.origin.first!.properties.latitude }
    var longtitude: Double { properties.products.origin.first!.properties.longtitude }
    private var properties: RootProperties

    struct RootProperties: Decodable {
        var products: Products
    }

    struct Products: Decodable {
        var origin: [Origin]
    }

    struct Origin: Decodable {
        var properties: OriginProperties
    }

    struct OriginProperties {
        var latitude: Double
        var longtitude: Double
    }
}

extension QuakeLocation.OriginProperties: Decodable {
    private enum OriginPropertiesCodingKeys: CodingKey {
        case latitude
        case longtitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OriginPropertiesCodingKeys.self)
        let longtitude = try container.decode(String.self, forKey: .longtitude)
        let latitude = try container.decode(String.self, forKey: .latitude)
        guard let longtitude = Double(longtitude), let latitude = Double(latitude) else {
            throw QuakeError.missingData
        }

        self.init(latitude: latitude, longtitude: longtitude)
    }
}
