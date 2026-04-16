//
//  StringExt.swift
//  BBQuotes
//
//  Created by Muhammad on 16/04/26.
//

import Foundation

extension String {
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpaces() -> String {
        self.lowercased().removeSpaces()
    }
}
