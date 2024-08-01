//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 31.07.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    var user: User? {
        viewModel.currentUser
    }
    @State private var showEditProfile = false
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: user)
                    
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 352, height: 32)
                            .foregroundColor(.black)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay{
                                RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                                    .foregroundStyle(.black)
                            }
                    }
                    UserContentListView()
                    
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
            .sheet(isPresented: $showEditProfile) {
                if let currentUser = user {
                    EditProfieView(user: currentUser)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
