//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 29.07.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var username = ""
    
    @MainActor
    func registerUser() async throws {
        try await AuthService.shared.register(email: email, password: password)
    }
}
