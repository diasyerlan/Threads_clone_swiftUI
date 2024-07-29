//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 27.07.2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("threads")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            TextField("Enter your email", text: $viewModel.email)
                .modifier(TextFieldViewModifier())
            TextField("Enter your password", text: $viewModel.password)
                .modifier(TextFieldViewModifier())
            TextField("Enter your full name", text: $viewModel.fullName)
                .modifier(TextFieldViewModifier())
            TextField("Enter your username", text: $viewModel.username)
                .modifier(TextFieldViewModifier())
            
            
            Button {
                Task {
                    try await viewModel.registerUser()
                }
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.vertical)
            
            
            Spacer()
            
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
            
        }
    }
}

#Preview {
    RegistrationView()
}
