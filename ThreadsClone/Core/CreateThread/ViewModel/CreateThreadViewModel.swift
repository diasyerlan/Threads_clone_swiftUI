//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 01.08.2024.
//

import Foundation
import FirebaseAuth
import Firebase

class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(userUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
        
        NotificationCenter.default.post(name: .threadPosted, object: nil)

    }
}

extension Notification.Name {
    static let threadPosted = Notification.Name("threadPosted")
}
