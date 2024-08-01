//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI
import FirebaseAuth

struct CreateThreadView: View {
    var user: User? {
        UserService.shared.currentUser
    }
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var caption = ""
    var body: some View {
        NavigationStack {
            HStack(alignment: .top) {
                ProfileImageView(user: user, size: .small)
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.username ?? "")
                        .fontWeight(.semibold)
                    TextField("Start a thread...", text: $caption, axis: .vertical)
                    Spacer()
                }
                .font(.footnote)
                Spacer()
                if !caption.isEmpty {
                    Button {
                        caption = ""
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    }
                }
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    } label: {
                        Text("Post")
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1)
                    .disabled(caption.isEmpty)
                }
            }
            .font(.subheadline)
            .foregroundColor(.black)
        }
    }
}

#Preview {
    CreateThreadView()
}
