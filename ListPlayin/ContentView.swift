//
//  ContentView.swift
//  ListPlayin
//
//  Created by Mike Kavouras on 6/17/23.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Flat list") {
                    FlatListView()
                }
                NavigationLink("Async flat list") {
                    AsyncFlatListView()
                }
                NavigationLink("Selection list") {
                    SelectionListView()
                }
                NavigationLink("Append cell list") {
                    AppendCellListView()
                }
                NavigationLink("Static tree list") {
                    StaticTreeListView()
                }
                NavigationLink("Disclosure group list") {
                    DisclosureGroupListView()
                }
                NavigationLink("Async disclosure group") {
                    AsyncDisclosureGroupListView()
                }
            }.navigationTitle("Lists")
        }
    }
}
