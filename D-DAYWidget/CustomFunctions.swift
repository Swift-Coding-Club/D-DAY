//
//  CustomFunctions.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

struct CustomFunctions {
    func calculateDday(ddayRecievedDate: String) -> Int {
        // D-day 날짜 계산
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        let formattedTargetDate = dateFormatter.date(from: ddayRecievedDate)!
        
        // 현재시간 (formattedCurrentDate)
        let currentDateString = dateFormatter.string(from: Date())
        let formattedCurrentDate = dateFormatter.date(from: currentDateString)!
        
        let timeInterval = Calendar.current.dateComponents([.day], from: formattedTargetDate, to: formattedCurrentDate)
        
        return timeInterval.day!
    }
    
    func ddaySetDorPlus(dateIntParam: Int) -> String {
        if dateIntParam < 0 {
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
}
