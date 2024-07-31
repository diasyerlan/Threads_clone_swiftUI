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
    
    func fetchUsers() async throws -> [User]{
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("Users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users.filter({ $0.id != uid })
    }
    func reset() {
        self.currentUser = nil
    }
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("Users").document(uid).updateData([
            "profileImageUrl": imageUrl
        ])
        self.currentUser?.profilePhoto = imageUrl
    }
}
