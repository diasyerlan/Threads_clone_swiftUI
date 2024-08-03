//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct ThreadCell: View {
    @StateObject var viewModel: ThreadCellViewModel
    init(thread: Thread) {
        self._viewModel = StateObject(wrappedValue: ThreadCellViewModel(thread: thread))
    }
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                ProfileImageView(user: viewModel.thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(viewModel.thread.user?.fullName ?? "")
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(viewModel.thread.timestamp.convertString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color(.darkGray))
                        
                    }
                        
                    Text(viewModel.thread.caption)
                    
                    HStack(spacing: 16) {
                        Button {
                            viewModel.updateLikes()
                        } label: {
                            if viewModel.isLiked {
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(.red)
                            } else {
                                Image(systemName: "heart")
                            }
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                }
                .font(.footnote)
                
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell(thread: DeveloperPreview.shared.thread)
}
