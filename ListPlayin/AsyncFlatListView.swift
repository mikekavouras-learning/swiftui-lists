//
//  ContentView.swift
//  ListPlayin
//
//  Created by Mike Kavouras on 6/17/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var values: [String] = []
    @Published var isConnected: Bool = false
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            self.values = (1...100).map { "\($0)" }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isConnected = true
        }
    }
}

struct AsyncFlatListView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if !$viewModel.isConnected.wrappedValue || viewModel.values.isEmpty{
                    HStack {
                        ProgressView()
                        Text("fetching...")
                            .padding(.leading)
                    }
                } else {
                    ForEach(viewModel.values, id: \.self) { value in
                        Text(value)
                    }
                }
            }
            .navigationTitle("Async Flat List")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
