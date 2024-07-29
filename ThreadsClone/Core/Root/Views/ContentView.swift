//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 26.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabBarView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
