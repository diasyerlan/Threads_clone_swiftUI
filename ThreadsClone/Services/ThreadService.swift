//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 01.08.2024.
//

import Foundation
import Firebase
import FirebaseFirestore

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("Threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("Threads").order(by: "timestamp", descending: true).getDocuments()
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
        return threads
    }
    
    static func fetchUserThread(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("Threads").whereField("userUid", isEqualTo: uid).getDocuments()
        let threads = snapshot.documents.compactMap({try? $0.data(as: Thread.self)})
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()})
    }
    
    static func updateLikes(thread: Thread, likes: Int) {
        let threadRef = Firestore.firestore().collection("Threads").document(thread.id)
        threadRef.updateData([
            "likes": likes
        ])
    }
}
