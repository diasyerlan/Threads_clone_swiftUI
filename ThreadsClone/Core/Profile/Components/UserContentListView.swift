//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 31.07.2024.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter = ProfileThreadFilter.threads
    @Namespace var animation
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold: .regular)
                        
                        if(selectedFilter == filter) {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: 180, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(width: 180, height: 1)
                            
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            LazyVStack {
                ForEach(0 ..< 10, id: \.self) { thread in
                    ThreadCell()
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}
