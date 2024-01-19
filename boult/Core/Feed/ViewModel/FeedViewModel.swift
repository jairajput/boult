//
//  FeedViewModel.swift
//  boult
//
//  Created by Jai  on 19/01/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var boults = [Boult]()
    
    init() {
        Task { try await fetchBoults() }
    }
    
    func fetchThreads() async throws {
        self.boults = try await BoultService.fetchBoults()
        try await fetchUserDataForBoults()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< boults.count {
            let boult = boults[i]
            let ownerUid = boult.ownerUid
            let boultUser = try await UserService.fetchUser(withUid: ownerUid)
            
            boults[i].user = boultUser
        }
    }
}
