//
//  Quakes+Toolbar.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import SwiftUI

extension Quakes {
    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            if editMode == .active {
                SelectButton(mode: $selectMode) {
                    if selectMode.isActive {
                        selection = Set(quakes.map { $0.code })
                    } else {
                        selection = []
                    }
                }
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            EditButton(editMode: $editMode) {
                selection.removeAll()
                editMode = .active
                selectMode = .active
            }
        }
        ToolbarItem(placement: .bottomBar) {
            RefreshButton {
                Task {
                    fetchQuakes()
                }
            }
            Spacer()
            ToolbarStatus(isLoading: isLoading, lastUpdated: lastUpdated, quakeCount: quakes.count)
            Spacer()
            if editMode == .active {
                DeleteButton {}
            }
        }
    }
}
