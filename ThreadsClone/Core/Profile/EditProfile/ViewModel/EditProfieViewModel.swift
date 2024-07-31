//
//  EditProfieViewModel.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 31.07.2024.
//

import Foundation
import PhotosUI
import SwiftUI

class EditProfieViewModel: ObservableObject {
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage()
            }
        }
    }
    
    func updateUserData() async throws {
        try await updateProfileImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedImage else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let url = try await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: url)
    }
    
}
