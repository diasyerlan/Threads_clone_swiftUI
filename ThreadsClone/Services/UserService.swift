//
//  UserService.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 30.07.2024.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

class UserService: ObservableObject {
    @Published var currentUser: User?
    
    static var shared = UserService()
    
    init() {
        Task {
            try await fetchUserData()
        }
    }
    @MainActor
    func fetchUserData() async throws {
        guard let uid = AuthService.shared.userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("Users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: \(user)")
    }
    
    func reset() {
        self.currentUser = nil
    }
}
