//
//  QuakeMagnitude.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import SwiftUI

struct QuakeMagnitude: View {
    let quake: Quake
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.black)
            .frame(width: 80, height: 60)
            .overlay {
                Text("\(quake.magnitude.formatted(.number.precision(.fractionLength(1))))")
                    .font(.title)
                    .bold()
                    .foregroundStyle(quake.color)
            }
    }
}

struct QuakeMagnitude_Previews: PreviewProvider {
    static var previewQuake = Quake(magnitude: 1.0,
                                    place: "Shakey Acres",
                                    time: Date(timeIntervalSinceNow: -1000),
                                    code: "nc73649170",
                                    detail: URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73649170.geojson")!,
                                    tsunami: 1)
    static var previews: some View {
        QuakeMagnitude(quake: previewQuake)
    }
}
