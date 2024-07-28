//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads, replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
