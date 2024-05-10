//
//  File.swift
//  
//
//  Created by Alisa Mylnikova on 17.05.2023.
//

import Foundation

extension Sequence {
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}
