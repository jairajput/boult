//
//  BoultService.swift
//  boult
//
//  Created by Jai  on 19/01/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct BoultService {
    
    static func uploadBoult(_ boult: Boult) async throws {
        guard let boultData = try? Firestore.Encoder().encode(boult) else { return }
        try await Firestore.firestore().collection("boults").addDocument(data: boultData)
    }
    
    static func fetchBoults() async throws -> [Boult] {
        let snapshot = try await Firestore
            .firestore()
            .collection("boults")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Boult.self ) })
    }
    
    static func fetchUserBoults(uid: String) async throws -> [Boult] {
        let snapshot = try await Firestore
            .firestore()
            .collection("boults")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let boults = snapshot.documents.compactMap({ try? $0.data(as: Boult.self ) })
        return boults.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}
