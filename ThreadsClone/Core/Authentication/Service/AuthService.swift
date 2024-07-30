//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 29.07.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    static let shared = AuthService()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG - \(String(describing: self.userSession))")
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User logged in with uid - \(result.user.uid)")
        }
        catch {
            print("DEBUG: Failed to log user in- \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func register(email: String, password: String, fullName: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(uid: result.user.uid, email: email, fullName: fullName, username: username)
        }
        catch {
            print("DEBUG: Failed to create user - \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    func uploadUserData(uid: String, email: String, fullName: String, username: String) async throws {
        let user = User(id: uid, email: email, fullName: fullName, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("Users").document(uid).setData(userData)
    }
}
