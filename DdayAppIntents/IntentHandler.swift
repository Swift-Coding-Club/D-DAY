//
//  IntentHandler.swift
//  DdayAppIntents
//
//  Created by MinJi Kang on 2023/02/15.
//

import Intents

class IntentHandler: INExtension, ConfigurationIntentHandling {
    func resolveSymbol(for intent: ConfigurationIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        
    }
    
    
//    override func handler(for intent: INIntent) -> Any {
//        // This is the default implementation.  If you want different objects to handle different intents,
//        // you can override this and return the handler you want for that particular intent.
//
//        return self
//    }
    
    func provideCustomSymbolOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<CustomSymbol>?, Error?) -> Void) {
        let symbols: [CustomSymbol] = [
            CustomSymbol(identifier: "AAPL", display: "Apple"),
            CustomSymbol(identifier: "TESL", display: "Tesla")
        ]
        // Create a collection with the array of characters.
        let collection = INObjectCollection(items: symbols)

        // Call the completion handler, passing the collection.
        completion(collection, nil)
    }
    
}
