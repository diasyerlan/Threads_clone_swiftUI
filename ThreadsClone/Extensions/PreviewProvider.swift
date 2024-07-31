//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 31.07.2024.
//

import SwiftUI

class DeveloperPreview {
    static var shared = DeveloperPreview()
    let user = User(id: NSUUID().uuidString, email: "test@gmail.com", fullName: "Test Test", username: "testest")
}
