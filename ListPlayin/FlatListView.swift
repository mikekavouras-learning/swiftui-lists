//
//  FlatList.swift
//  ListPlayin
//
//  Created by Mike Kavouras on 6/18/23.
//

import SwiftUI

struct FlatListView: View {
    var body: some View {
        let values = (0...100).map { "\($0)" }
        List(values, id: \.self) { value in
            Text(value)
        }
        .navigationTitle("Flat list")
    }
}
