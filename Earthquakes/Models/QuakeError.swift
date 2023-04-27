//
//  QuakeError.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import Foundation

enum QuakeError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a quake missing a valid code, magnitude, place, or time.",
                                     comment: "")
        case .networkError:
            return NSLocalizedString("Network error", comment: "")
        case let .unexpectedError(error):
            return NSLocalizedString("Unexpected Error \(error.localizedDescription)", comment: "")
        }
    }
}
