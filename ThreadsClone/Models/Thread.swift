//
//  Thread.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 01.08.2024.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    let userUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var user: User?
    
    mutating func incOrDec(isLiked: Bool) {
            if isLiked == true {
                likes -= 1
            } else {
                likes += 1
            }
        }
}
