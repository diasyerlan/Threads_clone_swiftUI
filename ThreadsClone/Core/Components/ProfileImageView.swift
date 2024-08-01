//
//  ProfileImageView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case small, medium, large
    
    var dimension: CGFloat {
        switch self {
        case .small: return 40
        case .medium: return 48
        case .large: return 56
        }
    }
}

struct ProfileImageView: View {
    var user: User?
    var size: ProfileImageSize
    var body: some View {
        if let url = user?.profileImageUrl {
            KFImage(URL(string: url))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .background(Color(.systemGray5))
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .background(Color(.systemGray4))
                .clipShape(Circle())
        }
    }
}

#Preview {
    ProfileImageView(user: DeveloperPreview.shared.user, size: .medium)
}
