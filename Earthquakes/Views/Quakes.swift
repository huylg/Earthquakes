//
//  ContentView.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import SwiftUI

struct Quakes: View {
    @AppStorage("lastUpdated")
    var lastUpdated = Date.distantFuture.timeIntervalSince1970

    @EnvironmentObject var provider: QuakesProvider
    @State var quakes = [Quake]()
    @State var editMode: EditMode = .inactive
    @State var selectMode: SelectMode = .inactive
    @State var isLoading = false
    @State var selection = Set<String>()
    @State private var error: QuakeError?
    @State private var hasError = false

    var body: some View {
        NavigationView {
            List(selection: $selection) {
                ForEach(quakes) {
                    Text($0.place)
                }
            }
            .listStyle(.inset)
            .navigationTitle(title)
            .refreshable {
                fetchQuakes()
            }
            .onAppear {
                fetchQuakes()
            }
        }
    }
}

extension Quakes {
    var title: String {
        !selectMode.isActive || selection.isEmpty ? "Earthquakes" : "\(selection.count) selected"
    }

    func fetchQuakes() {
        isLoading = true
        quakes = staticData
        lastUpdated = Date().timeIntervalSince1970
        isLoading = false
    }
}

let staticData = [
    Quake(magnitude:
        0.8, place: "Shakey Acres",
        time: Date(timeIntervalSinceNow: -1000),
        code: "nc73649170",
        detail: URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73649170.geojson")!,
        tsunami: 0),
    Quake(magnitude:
        2.2, place: "Rumble Alley",
        time: Date(timeIntervalSinceNow: -5000),
        code: "nv72783692",
        detail: URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/hv72783692")!,
        tsunami: 0),
]

struct Quakes_Previews: PreviewProvider {
    static var previews: some View {
        Quakes()
    }
}
