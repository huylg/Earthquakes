//
//  QuakeDetail.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 27/04/2023.
//

import SwiftUI

struct QuakeDetail: View {
    let quake: Quake
    @EnvironmentObject private var quakesProvider: QuakesProvider
    @State private var location: QuakeLocation?

    var body: some View {
        VStack {
            if let location {
                QuakeDetailMap(location: location, tintColor: quake.color)
            }
            QuakeMagnitude(quake: quake)
            Text(quake.place)
                .font(.title3)
                .bold()
            Text("\(quake.time.formatted())")
                .foregroundColor(.secondary)
            if let location {
                Text("\(location.latitude.formatted(.number.precision(.fractionLength(3))))")
                Text("\(location.longitude.formatted(.number.precision(.fractionLength(3))))")
            }
        }
        .task {
            if location == nil {
                if let quakeLocation = quake.location {
                    location = quakeLocation
                } else {
                    self.location = try? await quakesProvider.location(for: quake)
                }
            }
        }
    }
}

struct QuakeDetail_Previews: PreviewProvider {
    static var previews: some View {
        QuakeDetail(quake: Quake.sampleQuake)
    }
}
