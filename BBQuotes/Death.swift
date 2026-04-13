//
//  Death.swift
//  BBQuotes
//
//  Created by Muhammad on 13/04/26.
//

import Foundation

struct Death: Decodable {
    let character: String
    let image: URL
    let cause: String
    let details: String
    let lastWords: String 
}
