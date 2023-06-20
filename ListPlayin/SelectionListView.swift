//
//  MultiSelectionListView.swift
//  ListPlayin
//
//  Created by Mike Kavouras on 6/18/23.
//

import SwiftUI

struct Selectable: Identifiable {
    let value: String
    let id = UUID()
}

struct SelectionListView: View {
    @State private var selections: Set<String> = Set<String>()
    
    var body: some View {
        let values = (0...100).map { "\($0)" }
        List(values, id: \.self, selection: $selections) { value in
            SelectionCell(value: value)
        }
        .navigationTitle("Selection list")
        .toolbar {
            EditButton()
        }
        Text("\(selections.count) selection")
    }
}

struct SelectionCell: View {
    let value: String
    
    var body: some View {
        HStack {
            Text(value)
            Spacer()
        }.contentShape(Rectangle())
    }
}
