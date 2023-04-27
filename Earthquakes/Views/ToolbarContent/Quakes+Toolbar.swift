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
                        selection = Set(provider.quakes.map { $0.code })
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
                    await fetchQuakes()
                }
            }
            Spacer()
            ToolbarStatus(isLoading: isLoading, lastUpdated: lastUpdated, quakeCount: provider.quakes.count)
            Spacer()
            if editMode == .active {
                DeleteButton {
                    deleteQuakes(for: selection)
                }
                .disabled(isLoading || selection.isEmpty)
            }
        }
    }
}
