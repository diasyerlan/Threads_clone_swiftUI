//
//  ThreadCellViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 03.08.2024.
//

import Foundation

class ThreadCellViewModel: ObservableObject {
    @Published var isLiked = false
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
    }
    
    func updateLikes() {
        thread.incOrDec(isLiked: isLiked)
        isLiked.toggle()
        ThreadService.updateLikes(thread: thread, likes: thread.likes)
    }
}
