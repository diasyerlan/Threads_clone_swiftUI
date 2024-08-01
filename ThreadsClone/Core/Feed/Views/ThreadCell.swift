//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 28.07.2024.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                ProfileImageView(user: nil, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Patrick Bateman")
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text("10 min")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color(.darkGray))
                        
                    }
                        
                    Text("You know who I am")
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
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
    ThreadCell()
}
