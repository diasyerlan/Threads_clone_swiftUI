//
//  ProfileImageView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image("person")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .background(Color(.systemGray5))
            .clipShape(Circle())
    }
}

#Preview {
    ProfileImageView()
}
