//
//  User.swift
//  boult
//
//  Created by Jai  on 19/01/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}

