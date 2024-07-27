//
//  TextFieldViewModifier.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 27.07.2024.
//

import SwiftUI
import Foundation

struct TextFieldViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
            .textInputAutocapitalization(.never)
    }
}
