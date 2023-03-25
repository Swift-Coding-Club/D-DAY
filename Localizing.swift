//
//  Localizing.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/03/25.
//

import Foundation

public extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
}
