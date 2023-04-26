//
//  QuakeProvider.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import Foundation

class QuakesProvider: ObservableObject {
    @Published var quakes: [Quake] = []
    
    let client: QuakeClient
    
    func fetchQuakes() async throws {
        let lastestQuakes = try await client.quakes
        self.quakes = quakes
    }
    
    func deleteQuake(offsets: IndexSet)  {
        quakes.remove(atOffsets: offsets)
    }
    
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
    
}
