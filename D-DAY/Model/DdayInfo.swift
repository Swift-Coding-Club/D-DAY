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
    let isTodayCounted: Bool // 디데이 카운트 시 오늘을 포함하여 카운트 하는지
    let widgetTextColor: String? // UIColor -> String
    let widgetBGColor: String? // UIColor -> String
    let language: String?
    
    init(title: String, subTitle: String, date: Date, isTodayCounted: Bool, widgetTextColor: String?, widgetBGColor: String?, language: String?) {
        self.title = title
        self.subTitle = subTitle
        self.date = date
        self.isTodayCounted = isTodayCounted
        self.widgetTextColor = widgetTextColor
        self.widgetBGColor = widgetBGColor
        self.language = language
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


