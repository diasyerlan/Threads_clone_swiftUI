//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ..< 10, id: \.self) {item in
                        VStack {
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
