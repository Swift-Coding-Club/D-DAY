//
//  UserDefaultsExtension.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/31.
//

import Foundation

extension UserDefaults {
    
    func getDdayInfo() -> [DdayInfo] {
        let encodedData = UserDefaults(suiteName: "group.dday.ddayApp")!.array(forKey: KeyForUserDefaults) as? [Data] ?? []
        return encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
    }
    
}


