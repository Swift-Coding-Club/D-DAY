//
//  IntentHandler.swift
//  D-DAYIntents
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import Intents

// tableview list의 데이터를
struct DdayListDetail {
    let ddayTitle: String
    let ddayDate: String
    let ddayBgColor: String
    let ddayTxtColor: String
    let ddayLanguage: String
    
    static let ddayListDetail = [
        DdayListDetail(ddayTitle: "리스트 디테일 타이틀1", ddayDate: "2000.01.01", ddayBgColor: "ddayNeonPurple", ddayTxtColor: "ddayOrange", ddayLanguage: "english"),
        DdayListDetail(ddayTitle: "리스트 디테일 타이틀2", ddayDate: "2000.02.02", ddayBgColor: "ddayOrange", ddayTxtColor: "ddayNeonPurple", ddayLanguage: "korean"),
    ]
    
    // item.ddayTitle, item.ddayBgColor, ... 는 Userdefaults 에 저장한 이름으로 변경하기
//    static let ddayListDetail2 = UserDefaults.array.map { item in
//        let ddayItem = DdayListDetail(ddayTitle: item.ddayTitle, ddayDate: item.ddayDate, ddayBgColor: item.ddayBgColor, ddayTxtColor: item.ddayTxtColor, ddayLanguage: item.ddayLanguage)
//        return ddayItem
//    }
}

class IntentHandler: INExtension, ConfigurationIntentHandling {
    
    func provideDdaySymbolOptionsCollection(for intent: ConfigurationIntent, searchTerm: String?, with completion: @escaping (INObjectCollection<DdaySymbol>?, Error?) -> Void) {
        
        // tableview list의 데이터 불러오는 array (UserDefaults array) 를 CustomSymbol(identifier, display, pronunciationHint, subtitle, image: nil) 에 넣기
        
//        let symbols3: [DdaySymbol] = DdayListDetail.ddayListDetail.map { listItem in
//            let symbolDdayItem = DdaySymbol (
//                identifier: listItem.ddayTitle,
//                display: listItem.ddayTitle
//            )
//            symbolDdayItem.ddayTitle = listItem.ddayTitle
//            symbolDdayItem.ddayDate = listItem.ddayDate
//            symbolDdayItem.ddayBgColor = listItem.ddayBgColor
//            symbolDdayItem.ddayTxtColor = listItem.ddayTxtColor
//            symbolDdayItem.ddayLanguage = listItem.ddayLanguage
//
//            return symbolDdayItem
//        }
        
        let symbols: [DdaySymbol] = [
            // identifier: bg color
            // pronunciationHint: front color
            // display: dday title
            // subtitle: dday date
            DdaySymbol(identifier: "ddayNeonPurple", display: "디데이 타이틀01", pronunciationHint: "ddayOrange", subtitle: "2077.07.01", image: nil),
            DdaySymbol(identifier: "ddayOrange", display: "디데이 타이틀02", pronunciationHint: "ddayNeonPurple", subtitle: "2077.07.02", image: nil),
            DdaySymbol(identifier: "ddayNeonPurple", display: "디데이 타이틀03", pronunciationHint: "ddayNeonPink", subtitle: "2077.07.03", image: nil),
            DdaySymbol(identifier: "ddayNeonPink", display: "디데이 타이틀04", pronunciationHint: "ddayOrange", subtitle: "2077.07.04", image: nil),
        ]
        
        let symbols2: [DdaySymbol] = [
            DdaySymbol(identifier: "ddayNeonBlue", display: "디데이 타이틀05", pronunciationHint: "ddayOrange", subtitle: "2077.07.05", image: nil),
            DdaySymbol(identifier: "ddayCrimson", display: "디데이 타이틀06", pronunciationHint: "ddayNeonBlue", subtitle: "2077.07.06", image: nil),
            DdaySymbol(identifier: "ddayNeonPink", display: "디데이 타이틀07", pronunciationHint: "ddayCrimson", subtitle: "2077.07.07", image: nil),
        ]
        
        let sections: [INObjectSection<DdaySymbol>] = [
            INObjectSection(title: "DDAY-", items: symbols),
            INObjectSection(title: "DDAY+", items: symbols2)
        ]
        
        let collection = INObjectCollection(sections: sections)

        completion(collection, nil)
    }
    
}
