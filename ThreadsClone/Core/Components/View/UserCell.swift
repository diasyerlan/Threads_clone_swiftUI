//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct UserCell: View {
    var user: User
    var body: some View {
        HStack {
            ProfileImageView(user: user, size: .small)
            VStack(alignment: .leading, spacing: 2) {
                Text(user.fullName)
                    .fontWeight(.semibold)
                Text(user.username)
            }
            .font(.footnote)
            Spacer()
            Button {} label: {
                Text("Follow")
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.shared.user)
}
