//
//  AppendCellList.swift
//  ListPlayin
//
//  Created by Mike Kavouras on 6/18/23.
//

import SwiftUI

struct AppendCellListView: View {
    @State var items: [String] = []
    @State var i = 0
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                Section {
                    HStack {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                        Button("Add", action: addCell)
                        
                    }
                }
                Section {
                    ForEach(items, id: \.self) { item in
                        Text(item).id(item)
                    }
                }
            }
            .navigationTitle("Append cell list")
        }
    }
    
    private func addCell() {
        items.append("\(i)")
        i += 1
    }
}
