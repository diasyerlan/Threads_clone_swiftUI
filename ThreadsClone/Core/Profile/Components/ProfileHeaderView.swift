//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 31.07.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                if (user?.bio) != nil {
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
    }
}

#Preview {
    ProfileHeaderView()
}
