//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct CreateThreadView: View {
    @Environment(\.dismiss) var dismiss
    @State private var caption = ""
    var body: some View {
        NavigationStack {
            HStack(alignment: .top) {
                ProfileImageView(user: nil, size: .small)
                VStack(alignment: .leading, spacing: 4) {
                    Text("diasyerlan")
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
