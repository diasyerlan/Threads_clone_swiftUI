//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            ProfileImageView()
            VStack(alignment: .leading) {
                Text("Name Surname")
                    .fontWeight(.semibold)
                Text("Some description text")
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
    UserCell()
}
