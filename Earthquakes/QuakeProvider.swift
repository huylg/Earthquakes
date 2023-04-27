//
//  QuakeProvider.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import Foundation

@MainActor
class QuakesProvider: ObservableObject {
    @Published var quakes: [Quake] = []

    let client: QuakeClient

    func fetchQuakes() async throws {
        let lastestQuakes = try await client.quakes
        quakes = lastestQuakes
    }

    func deleteQuake(offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }

    func location(for quake: Quake) async throws -> QuakeLocation {
        try await client.quakeLocation(from: quake.detail)
    }

    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}
