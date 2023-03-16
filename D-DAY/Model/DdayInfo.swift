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
    let widgetTextColor: String? // UIColor -> String
    let widgetBGColor: String? // UIColor -> String
    let language: String?
    
//    init(title: String, subTitle: String, date: Date, widgetTextColor: String, widgetBGColor: String, language: String) {
//        self.title = title
//        self.subTitle = subTitle
//        self.date = date
//        self.widgetTextColor = widgetTextColor
//        self.widgetBGColor = widgetBGColor
//        self.language = language
//    }
    
    
//    private enum CodingKeys: CodingKey {
//        case title
//        case subTitle
//        case date
//        case widgetTextColor
//        case widgetBGColor
//        case language
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.title, forKey: .title)
//        try container.encode(self.subTitle, forKey: .subTitle)
//        try container.encode(self.date, forKey: .date)
//        try container.encode(self.widgetTextColor, forKey: .widgetTextColor)
//        try container.encode(self.widgetBGColor, forKey: .widgetBGColor)
//        try container.encode(self.language, forKey: .language)
//    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.subTitle = try container.decode(String.self, forKey: .subTitle)
//        self.date = try container.decode(Date.self, forKey: .date)
//        self.widgetTextColor = try container.decode(String.self, forKey: .widgetTextColor)
//        self.widgetBGColor = try container.decode(String.self, forKey: .widgetBGColor)
//        self.language = try container.decode(String.self, forKey: .language)
//    }
    
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


