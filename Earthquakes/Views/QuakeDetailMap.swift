//
//  QuakeDetailMap.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 27/04/2023.
//

import MapKit
import SwiftUI

struct QuakeDetailMap: View {
    let location: QuakeLocation
    let tintColor: Color
    private var place: QuakePlace
    
    @State private var region = MKCoordinateRegion()
    
    init(location: QuakeLocation, tintColor: Color) {
        self.tintColor = tintColor
        self.location = location
        self.place = QuakePlace(location: location)
    }

    var body: some View {
        Map(coordinateRegion: $region,annotationItems: [place]){ place in
            MapMarker(coordinate: place.location, tint: tintColor)
        }
        .onAppear {
            withAnimation {
                region.center = CLLocationCoordinate2D(latitude: -30.0, longitude: 130.0)
                region.span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
            }
        }
    }
}

struct QuakePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    
    init(id: UUID = UUID(), location: QuakeLocation) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
    
}
