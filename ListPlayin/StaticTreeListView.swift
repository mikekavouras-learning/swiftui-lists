//
//  StaticTreeList.swift
//  ListPlayin
//
//  Created by Mike Kavouras on 6/18/23.
//

import SwiftUI


struct StaticTreeListView: View {
    let items = FileItem.preview()
    
    var body: some View {
        List(items, children: \.children) { item in
            if item.isFolder {
                Label(item.title, systemImage: "folder.fill")
            } else {
                Label(item.title, systemImage: "envelope")
            }
        }
        .listStyle(.insetGrouped)
    }
}
