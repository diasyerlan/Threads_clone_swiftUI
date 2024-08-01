//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 31.07.2024.
//

import SwiftUI
import Firebase

class DeveloperPreview {
    static var shared = DeveloperPreview()
    let user = User(id: NSUUID().uuidString, email: "test@gmail.com", fullName: "Test Test", username: "testest")
    let thread = Thread(userUid: NSUUID().uuidString, caption: "blalblalbllaala", timestamp: Timestamp(), likes: 0)
}
