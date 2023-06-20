//
//  AsyncDisclosureGroupListView.swift
//  ListPlayin
//
//  Created by Mike Kavouras on 6/18/23.
//

import SwiftUI
import Foundation

class Characteristic: Identifiable, Equatable {
    let name: String
    let id = UUID()
    
    init(name: String) {
        self.name = name
    }
    
    static func ==(lhs: Characteristic, rhs: Characteristic) -> Bool {
        return lhs.id == rhs.id
    }
}

class Service: Identifiable, ObservableObject {
    let name: String
    @Published var characteristics: [Characteristic] = []
    @Published var isExpanded = false
    
    let id = UUID()
    
    init(name: String) {
        self.name = name
    }
    
    func fetchCharacteristics() {
        self.characteristics = [
            Characteristic(name: "one"),
            Characteristic(name: "two"),
            Characteristic(name: "three")
        ]
    }
}

struct AsyncDisclosureGroupListView: View {
    @State private var groups: [Service] = []
    
    private func loadServices() {
        withAnimation {
            groups = [
                Service(name: "Battery"),
                Service(name: "System info"),
                Service(name: "DFU")
            ]
        }
    }
    
    var body: some View {
        List {
            if groups.isEmpty {
                HStack {
                    ProgressView()
                    Text("fetching")
                        .padding(.leading)
                }
            } else {
                ForEach($groups) { group in
                    DisclosureGroup(group.wrappedValue.name, isExpanded: group.isExpanded) {
                        ForEach(group.characteristics) { char in
                            Text(char.wrappedValue.name)
                        }
                    }
                }
            }
        }
        .navigationTitle("Async disclosure")
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                loadServices()
            }
        }
    }
}
