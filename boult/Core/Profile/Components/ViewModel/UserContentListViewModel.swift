//
//  UserContentListViewModel.swift
//  boult
//
//  Created by Jai  on 19/01/24.
//


import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var boults = [Boult]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserBoults() }
    }
    
    @MainActor
    func fetchUserBoults() async throws {
        var boults = try await BoultService.fetchUserBoults(uid: user.id)
        
        for i in 0 ..< boults.count {
            boults[i].user = self.user
        }
        
        self.boults = boults
    }
}
