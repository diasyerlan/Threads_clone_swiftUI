//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 29.07.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
   
    
    @MainActor
    func loginUser() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
