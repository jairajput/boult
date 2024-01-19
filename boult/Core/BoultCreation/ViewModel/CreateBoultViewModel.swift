//
//  CreateBoultViewModel.swift
//  boult
//
//  Created by Jai  on 19/01/24.
//

import Firebase

class CreateBoultViewModel: ObservableObject {
    func uploadBoult(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let boult = Boult(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await BoultService.uploadBoult(boult)
    }
}

