//
//  JSONData.swift
//  SwiftUI-UrlJsonDataImage-Sample
//
//  Created by ekayaint on 12.08.2023.
//

import Foundation

struct JSONData : Identifiable, Decodable {
    var id: Int
    var login: String
    var avatar_url: String
    var followers_url: String
}
