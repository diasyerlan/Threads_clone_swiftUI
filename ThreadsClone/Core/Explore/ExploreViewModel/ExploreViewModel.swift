//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 31.07.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    func fetchUsers() async throws {
        self.users = try await UserService.shared.fetchUsers()
    }
}
