//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 30.07.2024.
//

import Foundation
import Firebase
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
            print("DEBUG: \(String(describing: currentUser))")
        }
        .store(in: &cancellables)
    }
    
}
