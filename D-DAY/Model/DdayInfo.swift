//
//  DDAYStruct.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/26.
//

import Foundation

struct DdayInfo: Codable, Hashable {
    let title: String
    let subTitle: String
    let date: Date
//        let widgetTextColor: UIColor
//        let widgetBGColor: UIColor
    
    init(title: String, subTitle: String, date: Date) {
        self.title = title
        self.subTitle = subTitle
        self.date = date
    }
}

let KeyForUserDefaults = "DdayInfoList"

func save(_ ddays: [DdayInfo]) {
    let data = ddays.map { try? JSONEncoder().encode($0) }
    UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
}

func load() -> [DdayInfo] {
//    guard let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] else {
//        return []
//    }
//
//    return encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
    
    //TODO: 해당 cell에 대한 UserDefaults값만 불러오기
    // UserDefaults 불러오기 (encode UserDefaults)
    let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] ?? []
    // 불러온 UserDefaults를 struct list에 넣어주기
    return encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
}


