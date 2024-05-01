//
//  UIApplication.swift
//  boult
//
//  Created by Jai  on 29/04/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

