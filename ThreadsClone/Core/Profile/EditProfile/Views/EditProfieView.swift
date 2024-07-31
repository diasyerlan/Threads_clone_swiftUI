//
//  EditProfieView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import Foundation
import SwiftUI
import PhotosUI

struct EditProfieView: View {
    @Environment(\.dismiss) var dismiss
    @State private var bio = ""
    @State private var link = ""
    @State private var isProfilePrivate = false
    @StateObject var viewModel = EditProfieViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("Dias Yerlan")
                        }
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedImage) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                ProfileImageView()
                            }
                        }
                    }
                    Divider()
                    Text("Bio")
                        .fontWeight(.semibold)
                    TextField("Enter your bio...", text: $bio, axis: .vertical)
                    
                    Divider()
                    
                    Text("Link")
                        .fontWeight(.semibold)
                    TextField("Add Link...", text: $link, axis: .vertical)
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $isProfilePrivate)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 1.0))
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                        }
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfieView()
}
