//
//  IntentHandler.swift
//  D-DAYIntents
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {
    
    func provideDdaySymbolOptionsCollection(for intent: ConfigurationIntent, searchTerm: String?, with completion: @escaping (INObjectCollection<DdaySymbol>?, Error?) -> Void) {
        
        let tableViewDdayList = UserDefaults(suiteName: "group.dday.ddayApp")!.getDdayInfo()
        
        let symbols: [DdaySymbol] = tableViewDdayList.map { listItem in
            
            // UserDefaults's date (model from DdayInfo.swift) - 1
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd"
            let listItemDate = dateFormatter.string(from: listItem.date)
            
            let symbolDdayItem = DdaySymbol (
                identifier: "identifier",
                display: listItem.title,
                pronunciationHint: "pronunciationHint",
//                subtitle: listItemDate,
                subtitle: String(listItem.isTodayCounted),
                image: nil
            )
            
            // UserDefaults's title (model from DdayInfo.swift)
            symbolDdayItem.ddayTitle = listItem.title
            
            // UserDefaults's date (model from DdayInfo.swift) - 2
            symbolDdayItem.ddayDate = listItemDate

            // UserDefaults's isTodayCounted checking (model from DdayInfo.swift)
            symbolDdayItem.ddayIsCountdown = String(listItem.isTodayCounted)
            
            // UserDefaults's widget text color (model from DdayInfo.swift)
            symbolDdayItem.ddayTxtColor = listItem.widgetTextColor ?? "ddayWhite"
            
            // UserDefaults's widget bg color (model from DdayInfo.swift)
            symbolDdayItem.ddayBgColor = listItem.widgetBGColor  ?? "ddayBlack"
            
            // UserDefaults's language (model from DdayInfo.swift)
            symbolDdayItem.ddayLanguage = listItem.language
            
            return symbolDdayItem
        }
        
        let collection = INObjectCollection(items: symbols)
        
        completion(collection, nil)
    }
    
}
