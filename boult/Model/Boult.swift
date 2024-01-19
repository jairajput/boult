//
//  Boult.swift
//  boult
//
//  Created by Jai  on 19/01/24.
//

import Firebase
import FirebaseFirestoreSwift

struct Boult: Identifiable, Codable {
    @DocumentID var boultId: String?
    
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return boultId ?? NSUUID().uuidString
    }
    
    var user: User?
}

