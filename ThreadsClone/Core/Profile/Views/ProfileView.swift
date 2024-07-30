//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter = ProfileThreadFilter.threads
    @Namespace var animation
    var user: User? {
        viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user?.fullName ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text(user?.username ?? "")
                                    .font(.subheadline)
                            }
                            if let bio = user?.bio {
                                Text("Some text")
                                    .font(.footnote)
                            }
                            Text("2 followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        ProfileImageView()
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 352, height: 32)
                            .foregroundColor(.white)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
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
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
