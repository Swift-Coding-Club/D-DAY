//
//  IntentHandler.swift
//  D-DAYIntents
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {
    
    func provideDdaySymbolOptionsCollection(for intent: ConfigurationIntent, searchTerm: String?, with completion: @escaping (INObjectCollection<DdaySymbol>?, Error?) -> Void) {
        
        var testArr = UserDefaults(suiteName: "group.dday.ddayApp")!.getDdayInfo()
        let stringTest = String(testArr[0].title)
        let stringTest1 = testArr[0].title.count
        let symbols3: [DdaySymbol] = testArr.map { listItem in
            let symbolDdayItem = DdaySymbol (
                identifier: "ddayNeonPurple",
                display: listItem.title,
                pronunciationHint: "ddayOrange",
                subtitle: "2017.07.01",
                image: nil
            )
            symbolDdayItem.ddayTitle = listItem.title
            symbolDdayItem.ddayDate = listItem.title
            symbolDdayItem.ddayBgColor = listItem.title
            symbolDdayItem.ddayTxtColor = listItem.title
            symbolDdayItem.ddayLanguage = listItem.title

            return symbolDdayItem
        }
        
        let collection = INObjectCollection(items: symbols3)
        
        completion(collection, nil)
    }
    
}
