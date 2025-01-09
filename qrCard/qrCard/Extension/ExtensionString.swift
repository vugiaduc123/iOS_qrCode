//
//  ExtensionString.swift
//  qrCard
//
//  Created by Vũ Đức on 9/1/25.
//

import Foundation
import UIKit

extension String {
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits.inverted
        return !self.isEmpty && rangeOfCharacter(from: characters) == nil
    }
}
