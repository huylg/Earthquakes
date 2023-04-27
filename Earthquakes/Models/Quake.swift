//
//  Quake.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import Foundation

struct Quake {
    let magnitude: Double
    let place: String
    let time: Date
    let code: String
    let detail: URL
    let tsunami: Int
    var location: QuakeLocation?
}

extension Quake: Identifiable {
    var id: String { code }
}

extension Quake: Codable {
    private enum CodingKeys: String, CodingKey {
        case magnitude = "mag"
        case place
        case time
        case code
        case detail
        case tsunami
    }

    init(from deconder: Decoder) throws {
        let values = try deconder.container(keyedBy: CodingKeys.self)
        let magnitude = try? values.decode(Double.self, forKey: .magnitude)
        let place = try? values.decode(String.self, forKey: .place)
        let time = try? values.decode(Date.self, forKey: .time)
        let code = try? values.decode(String.self, forKey: .code)
        let detail = try? values.decode(URL.self, forKey: .detail)
        let tsunami = try? values.decode(Int.self, forKey: .tsunami)

        guard let magnitude,
              let place,
              let time,
              let code,
              let detail,
              let tsunami
        else {
            throw QuakeError.missingData
        }

        self.init(magnitude: magnitude, place: place, time: time, code: code, detail: detail, tsunami: tsunami)
    }
}
