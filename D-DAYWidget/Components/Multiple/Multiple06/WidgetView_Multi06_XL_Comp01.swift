//
//  WidgetView_Multi06_XL_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/16.
//

import SwiftUI

struct WidgetView_Multi06_XL_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultStringArr: [[String]] = [
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor, ddayIsCountdown]
            ["길게눌러서 디데이 추가하기", "2023.08.04", "ddayBlack", "ddayLemon", "false"],
            ["길게눌러서 디데이 추가하기", "2023.06.04", "ddayWhite", "ddayBlack", "false"],
            ["길게눌러서 디데이 추가하기", "2023.03.04", "ddayWhite", "ddayBlack", "false"],
            ["길게눌러서 디데이 추가하기", "2023.04.04", "ddayBlack", "ddayLemon", "false"],
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
        
        
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 0) {
                
                // 1
                ZStack(alignment: .bottom) {
                    
                    // Title 1
                    switch (ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...5:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 40.0))
                            .frame(width: 330, height: 120, alignment: .topLeading)
                            .position(x: 168, y: 104)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))

                    case 6...10:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 35.0))
                            .frame(width: 330, height: 120, alignment: .topLeading)
                            .position(x: 168, y: 104)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 26.0))
                            .frame(width: 330, height: 120, alignment: .topLeading)
                            .position(x: 168, y: 104)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 23.0))
                            .frame(width: 330, height: 120, alignment: .topLeading)
                            .position(x: 168, y: 104)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                        
                    default:
                        Text("Error #F-Size M06-1-1")
                    }
                    
                    
                    // Date 1
                    Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 40, height: 50, alignment: .topLeading)
                        .position(x: 22, y: 176)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                    
                    
                    // DayNumber 1
                    ZStack {
                        switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false")).count {
                        case ...4:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 120.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                            
                        case 5:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 100.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 28)
                                .kerning(-9)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                            
                        case 6...:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 88.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 37)
                                .kerning(-8)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                            
                        default:
                            Text("Error #F-Count M06-1-1")
                        }
                    }
                    .frame(width: 295, height: 97, alignment: .bottomTrailing)
                    .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                }
                .position(x: 252.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                
                
                
                // 2
                ZStack(alignment: .bottom) {
                    
                    // Title 2
                    switch (ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...5:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 40.0))
                            .frame(width: 330, height: 120, alignment: .topTrailing)
                            .position(x: 230, y: 104)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))

                    case 6...10:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 35.0))
                            .frame(width: 330, height: 120, alignment: .topTrailing)
                            .position(x: 230, y: 104)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 26.0))
                            .frame(width: 330, height: 120, alignment: .topTrailing)
                            .position(x: 230, y: 104)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 23.0))
                            .frame(width: 330, height: 120, alignment: .topTrailing)
                            .position(x: 230, y: 104)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                        
                    default:
                        Text("Error #F-Size M06-1-2")
                    }
                    
                    // Date 2
                    Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 40, height: 50, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .position(x: 380, y: 176)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                    
                    // DayNumber 2
                    ZStack {
                        switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 1]?.ddayIsCountdown ?? "false")).count {
                        case ...4:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 1]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 120.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                            
                        case 5:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 1]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 100.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                            
                        case 6...:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 1]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 88.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                            
                        default:
                            Text("Error #F-Count M06-1-2")
                        }
                        
                    }
                    .frame(width: 295, height: 97, alignment: .bottomLeading)
                    .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                    
                }
                .position(x: 147.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
            }

            
            
            HStack(alignment: .top, spacing: 0) {
                
                // 3
                ZStack(alignment: .top) {
                    
                    // Title 3
                    switch (ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...5:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 40.0))
                            .frame(width: 330, height: 120, alignment: .bottomLeading)
                            .position(x: 168, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))

                    case 6...10:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 35.0))
                            .frame(width: 330, height: 120, alignment: .bottomLeading)
                            .position(x: 168, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 26.0))
                            .frame(width: 330, height: 120, alignment: .bottomLeading)
                            .position(x: 168, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 23.0))
                            .frame(width: 330, height: 120, alignment: .bottomLeading)
                            .position(x: 168, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                        
                    default:
                        Text("Error #F-Size M06-1-3")
                    }
                    
                    // Date 3
                    Text(ddaySymbolMenu[safe: 2]?.ddayDate ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 40, height: 50, alignment: .topLeading)
                        .position(x: 22, y: 46)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                    
                    // DayNumber 3
                    ZStack {
                        switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 2]?.ddayIsCountdown ?? "false")).count {
                        case ...4:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 2]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 120.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                            
                        case 5:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 2]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 100.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                            
                        case 6...:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 2]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 88.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                            
                        default:
                            Text("Error #F-Count M06-1-3")
                        }
                        
                    }
                    .frame(width: 295, height: 97, alignment: .bottomLeading)
                    .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                }
                .position(x: 252.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                
                
                
                // 4
                ZStack(alignment: .top) {
                    
                    // Title 4
                    switch (ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...5:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 40.0))
                            .frame(width: 330, height: 120, alignment: .bottomTrailing)
                            .position(x: 230, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))

                    case 6...10:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 35.0))
                            .frame(width: 330, height: 120, alignment: .bottomTrailing)
                            .position(x: 230, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 26.0))
                            .frame(width: 330, height: 120, alignment: .bottomTrailing)
                            .position(x: 230, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 23.0))
                            .frame(width: 330, height: 120, alignment: .bottomTrailing)
                            .position(x: 230, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                        
                    default:
                        Text("Error #F-Size M06-1-4")
                    }
                    
                    
                    // Date 4
                    Text(ddaySymbolMenu[safe: 3]?.ddayDate ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 40, height: 50, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .position(x: 380, y: 46)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    
                    
                    // DayNumber 4
                    ZStack {
                        switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 3]?.ddayIsCountdown ?? "false")).count {
                        case ...4:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 3]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 120.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                            
                        case 5:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 3]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 100.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                            
                        case 6...:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 3]?.ddayIsCountdown ?? "false")))")
                                .font(.custom("Inter-ExtraBold", size: 88.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                            
                        default:
                            Text("Error #F-Count M06-1-4")
                        }
                    }
                    .frame(width: 295, height: 97, alignment: .bottomTrailing)
                    .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                }
                .position(x: 147.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
            }
        }
    }
}
