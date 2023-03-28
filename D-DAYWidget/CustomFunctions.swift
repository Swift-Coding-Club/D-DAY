//
//  CustomFunctions.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

/****
 Custom Functions
 1. calculateDday (ddayRecievedDate: String) -> Int
 2. ddaySetNoneOrPlus (dateIntParam: Int) -> String
 3. ddaySetDorPlus (dateIntParam: Int) -> String
 4. dateIntSign (dateIntParam: Int) -> String
 5. makeSignedDateNumber (dateIntParam: Int) -> String
*/
struct CustomFunctions {
    func calculateDday(ddayRecievedDate: String, isTodayCounted: String) -> Int {
        // D-day 날짜 계산
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        let formattedTargetDate = dateFormatter.date(from: ddayRecievedDate)!
        
        // 현재시간 (formattedCurrentDate)
        let currentDateString = dateFormatter.string(from: Date())
        let formattedCurrentDate = dateFormatter.date(from: currentDateString)!
        
        let timeInterval = Calendar.current.dateComponents([.day], from: formattedTargetDate, to: formattedCurrentDate)
        
        return isTodayCounted.bool ?? false ? (timeInterval.day! + 1) : timeInterval.day!
    }
    
    func ddaySetNoneOrPlus(dateIntParam: Int) -> String {
        if dateIntParam < 0 {
            return ""
        } else {
            return "+"
        }
    }
    
    func ddaySetDorPlus(dateIntParam: Int) -> String {
        if dateIntParam <= 0 {
            return "D"
        } else {
            return "+"
        }
    }
    
    func dateIntSign(dateIntParam: Int) -> String {
        if dateIntParam < 0 {
            return String(format: "%02d", (-1) * dateIntParam)
        } else {
            return String(format: "%02d", dateIntParam)
        }
    }
    
    func makeSignedDateNumber(dateIntParam: Int) -> String {
        if dateIntParam >= 0 {
            return "+\(dateIntParam)"
        } else {
            return "\(dateIntParam)"
        }
    }
}


/****
 Extensions
 1 . Color
 2.  Array
 3. String
*/
extension Color {
    init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(
        red: CGFloat(red) / 255.0,
        green: CGFloat(green) / 255.0,
        blue: CGFloat(blue) / 255.0
       )
   }
    
    init(hex: Int) {
       self.init(
           red: (hex >> 16) & 0xFF,
           green: (hex >> 8) & 0xFF,
           blue: hex & 0xFF
       )
    }
    
    init(hex: String) {
        var normalizedHexColor = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()

        if normalizedHexColor.hasPrefix("#") {
            normalizedHexColor = String(normalizedHexColor.dropFirst())
            
            // Convert to hexadecimal color (string) to integer
            var hex: UInt64 = 0
            Scanner(string: normalizedHexColor).scanHexInt64(&hex)
            
            self.init(
                hex: Int(hex)
            )
        } else {
            self.init(hex)
        }
    }
}

extension Array {
    subscript (safe index: Int) -> Element? {
        // iOS 9 or later
        return indices ~= index ? self[index] : nil
        // iOS 8 or earlier
        // return startIndex <= index && index < endIndex ? self[index] : nil
        // return 0 <= index && index < self.count ? self[index] : nil
    }
}

extension String {
    var bool: Bool? {
        switch self.lowercased() {
        case "true":
            return true
        case "false":
            return false
        default:
            return nil
        }
    }
}



/****
 Widget Configurations
 1. DefaultArrForWidget_M03
 2. DefaultArrForWidget_M08
*/
struct DefaultArrForWidget_M03 {
    
    func getDaySymbolMenu(entry: Provider.Entry) -> [DdaySymbol] {
        
        let defaultStringArr: [[String]] = [
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor, ddayIsCountdown]
            ["길게눌러서 디데이 추가하기", "2024.01.04", "ddayBlack", "ddayWhite", "false"],
            ["길게눌러서 디데이 추가하기", "2024.02.04", "ddayBlack", "ddayWhite", "false"],
            ["길게눌러서 디데이 추가하기", "2023.10.04", "ddayBlack", "ddayWhite", "false"],
        ]
        
        let defaultDdaySymbolMenu: [DdaySymbol] = defaultStringArr.map { sArray in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = sArray[0]
            symbolDdayItem.ddayDate = sArray[1]
            symbolDdayItem.ddayBgColor = sArray[2]
            symbolDdayItem.ddayTxtColor = sArray[3]
            symbolDdayItem.ddayIsCountdown = sArray[4]
            
            return symbolDdayItem
        }
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        return ddaySymbolMenu
    }
}

struct DefaultArrForWidget_M08 {
    
    func getDaySymbolMenu(entry: Provider.Entry) -> [DdaySymbol] {
        
        let defaultStringArr: [[String]] = [
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor, ddayIsCountdown]
            ["길게눌러서 디데이 추가하기", "2023.08.04", "ddayNeonGreen", "ddayBlack", "false"],
            ["길게눌러서 디데이 추가하기", "2023.05.04", "ddayNeonCrimson", "ddayOrangeLighter", "false"],
            ["길게눌러서 디데이 추가하기", "2024.01.04", "ddayNeonSkyBlue", "ddayYellow", "false"],
            ["길게눌러서 디데이 추가하기", "2022.10.04", "ddayNeonBlueDarker", "ddayNeonCrimson", "false"],
            ["길게눌러서 디데이 추가하기", "2023.03.25", "ddayNeonPurple", "ddayNeonEmerald", "false"],
            ["길게눌러서 디데이 추가하기", "2023.08.15", "ddayToneDownBabyPink", "ddayToneDownHotPink", "false"],
            ["길게눌러서 디데이 추가하기", "2024.10.24", "ddayNeonOrange", "ddayNeonGreanBrighter", "false"],
            ["길게눌러서 디데이 추가하기", "2023.05.20", "ddayNeonPink", "ddayNeonYellow", "false"],
        ]
        
        let defaultDdaySymbolMenu: [DdaySymbol] = defaultStringArr.map { sArray in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = sArray[0]
            symbolDdayItem.ddayDate = sArray[1]
            symbolDdayItem.ddayBgColor = sArray[2]
            symbolDdayItem.ddayTxtColor = sArray[3]
            symbolDdayItem.ddayIsCountdown = sArray[4]
            
            return symbolDdayItem
        }
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        return ddaySymbolMenu
    }
}
