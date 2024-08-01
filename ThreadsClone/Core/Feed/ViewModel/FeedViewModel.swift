//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 01.08.2024.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init() {
        Task {
            try await fetchThreads()
        }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserdata()
    }
    
    func fetchUserdata() async throws {
        for i in 0 ..< threads.count {
            let uid = threads[i].userUid
            let user = try await UserService.shared.fetchUser(byUid: uid)
            threads[i].user = user
        }
    }
}
