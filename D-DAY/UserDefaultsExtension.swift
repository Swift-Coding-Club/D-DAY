////
////  UserDefaultsExtension.swift
////  D-DAY
////
////  Created by MinJi Kang on 2023/01/31.
////
//
//import Foundation
//
//protocol ObjectSavable {
//    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
//    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
//}
//
//enum ObjectSavableError: String, LocalizedError {
//    case unableToEncode = "Unable to encode object into data"
//    case noValue = "No data object found for the given key"
//    case unableToDecode = "Unable to decode object into given type"
//
//    var errorDescription: String? {
//        rawValue
//    }
//}
//
//extension UserDefaults: ObjectSavable {
//    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
//
//        let encoder = JSONEncoder()
//
//        if let data = try? encoder.encode(object) {
//            UserDefaults.standard.set(data, forKey: forKey)
//        } else {
//            throw ObjectSavableError.unableToEncode
//        }
//
//    }
//
//    func getDDayList(forKey: String) ->  {
//
//        let decoder = JSONDecoder()
//
//        if let data = UserDefaults.standard.data(forKey: forKey) {
//            let array = try! PropertyListDecoder().decode([DdayInfo].self, from: data)
//        } else {
//            throw ObjectSavableError.unableToDecode
//        }
//
////        let decoder = JSONDecoder()
////        do {
////            let object = try decoder.decode(type, from: data)
////            return object
////        } catch {
////            throw ObjectSavableError.unableToDecode
////        }
//    }
//}
