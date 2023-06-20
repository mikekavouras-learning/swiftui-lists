//
//  DisclosureGroupList.swift
//  ListPlayin
//
//  Created by Mike Kavouras on 6/18/23.
//

import SwiftUI

struct DisclosureGroupListView: View {
    @State private var firstGroupIsExpanded: Bool = false
    @State private var secondGroupIsExpanded: Bool = false
    @State private var firstGroupItems: [String] = (0...5).map { "\($0)" }
    @State private var secondGroupItems: [String] = (0...3).map { "\($0)" }
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("First group", isExpanded: $firstGroupIsExpanded) {
                    ForEach(firstGroupItems, id: \.self) { item in
                        Text(item)
                    }
                }
            } header: {
                Text("The first group")
            } footer: {
                Text("Please don't do this at home. Professionals only.")
            }
            
            Section {
                DisclosureGroup("Second group", isExpanded: $secondGroupIsExpanded) {
                    ForEach(secondGroupItems, id: \.self) { item in
                        Text(item)
                    }
                }
            } header: {
                Text("The second group")
            } footer: {
                Text("Everyone was hurt making this list. Please, please leave it to the professionals.")
            }
        }.navigationTitle("Disclosure")
    }
}
