//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0 ..< 10, id: \.self) { thread in
                        ThreadCell()
                    }
                }
            }
            .refreshable {
                
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "arrow.counterclockwise")
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
