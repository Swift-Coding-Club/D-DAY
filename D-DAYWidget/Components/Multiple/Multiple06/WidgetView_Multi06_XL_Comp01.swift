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
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor]
            ["길게눌러서 디데이 추가하기", "2023.10.04", "ddayOrange", "ddayNeonYellow"],
            ["길게눌러서 디데이 추가하기", "2023.05.04", "ddayChristmasGreen", "ddayChristmasRed"],
            ["길게눌러서 디데이 추가하기", "2023.03.04", "ddayLightOrange", "ddayBabyPurpleBrighter"],
            ["길게눌러서 디데이 추가하기", "2023.02.04", "ddayPurpleDarker", "ddayDriedRosePink"],
        ]
        
        let defaultDdaySymbolMenu: [DdaySymbol] = defaultStringArr.map { sArray in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = sArray[0]
            symbolDdayItem.ddayDate = sArray[1]
            symbolDdayItem.ddayBgColor = sArray[2]
            symbolDdayItem.ddayTxtColor = sArray[3]
            
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
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))

                    case 6...10:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 35.0))
                            .frame(width: 330, height: 120, alignment: .topLeading)
                            .position(x: 168, y: 104)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 26.0))
                            .frame(width: 330, height: 120, alignment: .topLeading)
                            .position(x: 168, y: 104)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 23.0))
                            .frame(width: 330, height: 120, alignment: .topLeading)
                            .position(x: 168, y: 104)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    default:
                        Text("Error #F-Size M06-1-1")
                    }
                    
                    
                    // Date 1
                    Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 40, height: 50, alignment: .topLeading)
                        .position(x: 22, y: 176)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                    
                    
                    // DayNumber 1
                    ZStack {
                        switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))).count {
                        case ...4:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 120.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayOrange"))
                            
                        case 5:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 100.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 28)
                                .kerning(-9)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayOrange"))
                            
                        case 6...:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 88.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 37)
                                .kerning(-8)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayOrange"))
                            
                        default:
                            Text("Error #F-Count M06-1-1")
                        }
                    }
                    .frame(width: 295, height: 97, alignment: .bottomTrailing)
                    .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                }
                .position(x: 252.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayOrange"))
                
                
                
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
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayChristmasRed"))

                    case 6...10:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 35.0))
                            .frame(width: 330, height: 120, alignment: .topTrailing)
                            .position(x: 230, y: 104)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayChristmasRed"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 26.0))
                            .frame(width: 330, height: 120, alignment: .topTrailing)
                            .position(x: 230, y: 104)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayChristmasRed"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 23.0))
                            .frame(width: 330, height: 120, alignment: .topTrailing)
                            .position(x: 230, y: 104)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayChristmasRed"))
                        
                    default:
                        Text("Error #F-Size M06-1-2")
                    }
                    
                    // Date 2
                    Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 40, height: 50, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .position(x: 380, y: 176)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayChristmasRed"))
                    
                    // DayNumber 2
                    ZStack {
                        switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))).count {
                        case ...4:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 120.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayChristmasGreen"))
                            
                        case 5:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 100.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayChristmasGreen"))
                            
                        case 6...:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 88.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayChristmasGreen"))
                            
                        default:
                            Text("Error #F-Count M06-1-2")
                        }
                        
                    }
                    .frame(width: 295, height: 97, alignment: .bottomLeading)
                    .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayChristmasRed"))
                    
                }
                .position(x: 147.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayChristmasGreen"))
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
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayBabyPurpleBrighter"))

                    case 6...10:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 35.0))
                            .frame(width: 330, height: 120, alignment: .bottomLeading)
                            .position(x: 168, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayBabyPurpleBrighter"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 26.0))
                            .frame(width: 330, height: 120, alignment: .bottomLeading)
                            .position(x: 168, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayBabyPurpleBrighter"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 23.0))
                            .frame(width: 330, height: 120, alignment: .bottomLeading)
                            .position(x: 168, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayBabyPurpleBrighter"))
                        
                    default:
                        Text("Error #F-Size M06-1-3")
                    }
                    
                    // Date 3
                    Text(ddaySymbolMenu[safe: 2]?.ddayDate ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 40, height: 50, alignment: .topLeading)
                        .position(x: 22, y: 46)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayBabyPurpleBrighter"))
                    
                    // DayNumber 3
                    ZStack {
                        switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))).count {
                        case ...4:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 120.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayBgColor ?? "ddayLightOrange"))
                            
                        case 5:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 100.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayBgColor ?? "ddayLightOrange"))
                            
                        case 6...:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 88.0))
                                .frame(width: 380, height: 49, alignment: .topLeading)
                                .position(x: 174, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayBgColor ?? "ddayLightOrange"))
                            
                        default:
                            Text("Error #F-Count M06-1-3")
                        }
                        
                    }
                    .frame(width: 295, height: 97, alignment: .bottomLeading)
                    .background(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayBabyPurpleBrighter"))
                }
                .position(x: 252.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color(hex: ddaySymbolMenu[safe: 2]?.ddayBgColor ?? "ddayLightOrange"))
                
                
                
                // 4
                ZStack(alignment: .top) {
                    
                    // Title 4
                    switch (ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...5:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 40.0))
                            .frame(width: 330, height: 120, alignment: .bottomTrailing)
                            .position(x: 230, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayDriedRosePink"))

                    case 6...10:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 35.0))
                            .frame(width: 330, height: 120, alignment: .bottomTrailing)
                            .position(x: 230, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayDriedRosePink"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 26.0))
                            .frame(width: 330, height: 120, alignment: .bottomTrailing)
                            .position(x: 230, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayDriedRosePink"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 23.0))
                            .frame(width: 330, height: 120, alignment: .bottomTrailing)
                            .position(x: 230, y: 100)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayDriedRosePink"))
                        
                    default:
                        Text("Error #F-Size M06-1-4")
                    }
                    
                    
                    // Date 4
                    Text(ddaySymbolMenu[safe: 3]?.ddayDate ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 40, height: 50, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .position(x: 380, y: 46)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayDriedRosePink"))
                    
                    
                    // DayNumber 4
                    ZStack {
                        switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"))).count {
                        case ...4:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 120.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayBgColor ?? "ddayPurpleDarker"))
                            
                        case 5:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 100.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayBgColor ?? "ddayPurpleDarker"))
                            
                        case 6...:
                            Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"))))")
                                .font(.custom("Inter-ExtraBold", size: 88.0))
                                .frame(width: 380, height: 49, alignment: .topTrailing)
                                .position(x: 104, y: 12)
                                .kerning(-10)
                                .clipped()
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayBgColor ?? "ddayPurpleDarker"))
                            
                        default:
                            Text("Error #F-Count M06-1-4")
                        }
                    }
                    .frame(width: 295, height: 97, alignment: .bottomTrailing)
                    .background(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayDriedRosePink"))
                }
                .position(x: 147.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color(hex: ddaySymbolMenu[safe: 3]?.ddayBgColor ?? "ddayPurpleDarker"))
            }
        }
    }
}
