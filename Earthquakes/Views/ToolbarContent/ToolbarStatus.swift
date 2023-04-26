//
//  ToolbarStatus.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import SwiftUI

struct ToolbarStatus: View {
    var isLoading: Bool
    var lastUpdated: TimeInterval
    var quakeCount: Int

    var body: some View {
        VStack {
            if isLoading {
                Text("Checking for Earthquakes...")
                Spacer()
            } else if lastUpdated == Date.distantFuture.timeIntervalSince1970 {
                Spacer()
                Text("\(quakeCount) Earthquakes")
                    .foregroundStyle(Color.secondary)
            } else {
                let lastUpdatedDate = Date(timeIntervalSince1970: lastUpdated)
                Text("Updated \(lastUpdatedDate.formatted(.relative(presentation: .named)))")
                Text("\(quakeCount) Earthquakes")
                    .foregroundStyle(Color.secondary)
            }
        }
    }
}

struct ToolbarStatus_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarStatus(isLoading: true, lastUpdated: Date.distantPast.timeIntervalSince1970, quakeCount: 120)
        ToolbarStatus(isLoading: false, lastUpdated: Date.distantFuture.timeIntervalSince1970, quakeCount: 10000)
        ToolbarStatus(isLoading: false, lastUpdated: Date.now.timeIntervalSince1970, quakeCount: 10000)
        ToolbarStatus(isLoading: false, lastUpdated: Date.distantPast.timeIntervalSince1970, quakeCount: 10000)
    }
}
