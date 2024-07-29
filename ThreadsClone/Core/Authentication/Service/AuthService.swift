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
    @Published var usersession: FirebaseAuth.User?
    
    init() {
        self.usersession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.usersession = result.user
            print("DEBUG: User logged in with uid - \(result.user.uid)")
        }
        catch {
            print("DEBUG: Failed to log user in- \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func register(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.usersession = result.user
            print("DEBUG: User created with uid - \(result.user.uid)")
        }
        catch {
            print("DEBUG: Failed to create user - \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.usersession = nil
    }
}
