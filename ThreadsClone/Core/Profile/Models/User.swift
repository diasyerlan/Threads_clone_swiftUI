//
//  User.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 30.07.2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    var email: String
    var fullName: String
    var username: String
    var profilePhoto: String?
    var bio: String?
}
