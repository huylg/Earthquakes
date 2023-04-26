//
//  QuakeError.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import Foundation

enum QuakeError: Error {
    case missingData
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a quake missing a valid code, magnitude, place, or time.",
                                     comment: "")
        }
    }
}
