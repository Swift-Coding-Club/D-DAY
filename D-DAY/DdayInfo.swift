//
//  DDAYStruct.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/26.
//

import Foundation

struct DdayInfo: Codable {
    let title: String
    let subTitle: String
    let date: Date
//        let widgetTextColor: UIColor
//        let widgetBGColor: UIColor
}

let KeyForUserDefaults = "DdayInfoList"

func save(_ ddays: [DdayInfo]) {
    let data = ddays.map { try? JSONEncoder().encode($0) }
    UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
}

func load() -> [DdayInfo] {
    guard let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] else {
        return []
    }

    return encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
}
