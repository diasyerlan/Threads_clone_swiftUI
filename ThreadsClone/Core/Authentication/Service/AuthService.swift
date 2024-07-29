//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 29.07.2024.
//

import Foundation
import Firebase

class AuthService {
    static let shared = AuthService()
    
    @MainActor
    func login(email: String, password: String) async throws {
        
    }
    
    @MainActor
    func register(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: User created with uid - \(result.user.uid)")
        }
        catch {
            print("DEBUG: Failed to create user - \(error.localizedDescription)")
        }
    }
}
