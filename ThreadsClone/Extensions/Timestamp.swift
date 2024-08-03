//
//  Timestamp.swift
//  ThreadsClone
//
//  Created by Dias Yerlan on 02.08.2024.
//

import Foundation
import Firebase

extension Timestamp {
    func convertString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
