//
//  EditButton.swift
//  Earthquakes
//
//  Created by Ly Gia Huy on 26/04/2023.
//

import SwiftUI

struct EditButton: View {
    @Binding var editMode: EditMode
    var action: () -> Void = {}

    var body: some View {
        Button {
            withAnimation {
                if editMode == .active {
                    action()
                    editMode = .inactive
                } else {
                    editMode = .active
                }
            }
        } label: {
            if editMode == .active {
                Text("Cancel").bold()
            } else {
                Text("Edit")
            }
        }
    }
}

struct EditButton_Previews: PreviewProvider {
    static var previews: some View {
        EditButton(editMode: .constant(.active))
        EditButton(editMode: .constant(.inactive))
        EditButton(editMode: .constant(.transient))
    }
}
