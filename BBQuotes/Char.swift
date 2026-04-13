//
//  Char.swift
//  BBQuotes
//
//  Created by Muhammad on 13/04/26.
//

import Foundation

struct Char: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let portrayedBy: String
    let death: Death?
}
