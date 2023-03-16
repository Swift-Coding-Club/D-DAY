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
            
            // UserDefaults's title (model from DdayInfo.swift)
            symbolDdayItem.ddayTitle = listItem.title
            
            // UserDefaults's date (model from DdayInfo.swift)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd"
            let listItemDate = dateFormatter.string(from: listItem.date)
            symbolDdayItem.ddayDate = listItemDate

            // UserDefaults's widget text color (model from DdayInfo.swift)
            symbolDdayItem.ddayTxtColor = listItem.widgetTextColor
            
            // UserDefaults's widget bg color (model from DdayInfo.swift)
            symbolDdayItem.ddayBgColor = listItem.widgetBGColor
            
            // UserDefaults's language (model from DdayInfo.swift)
            symbolDdayItem.ddayLanguage = listItem.language

            return symbolDdayItem
        }
        
        let collection = INObjectCollection(items: symbols3)
        
        completion(collection, nil)
    }
    
}
