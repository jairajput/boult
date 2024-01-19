//
//  ProfileBoultFilter.swift
//  boult
//
//  Created by Jai  on 19/01/24.
//

import Foundation
enum ProfileBoultFilter: Int, CaseIterable, Identifiable {
    case boults
    case replies
    
    var title: String {
        switch self {
        case .boults: return "Boults"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
