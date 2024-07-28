//
//  EditProfieView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import Foundation
import SwiftUI

struct EditProfieView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isProfilePrivate = false
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
                        ProfileImageView()
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
                    Button {} label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Text("Save")
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
