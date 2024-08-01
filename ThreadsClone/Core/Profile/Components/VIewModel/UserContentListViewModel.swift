//
//  UserContentListViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 01.08.2024.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var threads = [Thread]()
    let user: User
    
    init(user: User) {
        self.user = user
        Task {
            try await fetchUserThreads()
        }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThread(uid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = user
        }
        self.threads = threads
    }
}
