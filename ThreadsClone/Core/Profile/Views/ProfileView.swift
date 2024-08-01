//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
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
                UserContentListView(user: user)
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
