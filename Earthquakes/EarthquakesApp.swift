//
//  EarthquakesApp.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import SwiftUI

@main
struct EarthquakesApp: App {
    @StateObject var quakesProvider = QuakesProvider()
    var body: some Scene {
        WindowGroup {
            Quakes()
                .environmentObject(quakesProvider)
        }
    }
}
