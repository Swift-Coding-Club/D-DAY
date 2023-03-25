//
//  WidgetView_Multi07_XL_Comp02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/16.
//

import SwiftUI

struct WidgetView_Multi07_XL_Comp02: View { // enable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultStringArr: [[String]] = [
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor]
            ["길게눌러서 디데이 추가하기", "2023.10.04", "ddayNeonYellow", "ddayBlack"],
            ["길게눌러서 디데이 추가하기", "2023.05.04", "ddayNeonYellow", "ddayBlack"],
            ["길게눌러서 디데이 추가하기", "2023.03.04", "ddayNeonYellow", "ddayBlack"],
            ["길게눌러서 디데이 추가하기", "2021.02.04", "ddayNeonYellow", "ddayBlack"],
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
        
        ZStack {
            // top stack 1
            ZStack {
                ZStack {
                    
                    // Date 1
                    Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2099.02.28")
                        .font(.custom("Inter-Bold", size: 16.0))
                        .frame(width: 100, height: 30, alignment: .topLeading)
                        .position(x: 75, y: 35)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                    
                    // Title 1
                    switch (ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...5:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 28.0))
                            .frame(width: 155, height: 54, alignment: .topTrailing)                                    .position(x: 212, y: 42)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                        
                    case 6...10:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 22.0))
                            .frame(width: 155, height: 54, alignment: .topTrailing)
                            .position(x: 212, y: 42)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 19.0))
                            .frame(width: 155, height: 54, alignment: .topTrailing)
                            .position(x: 212, y: 42)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 17.0))
                            .frame(width: 160, height: 64, alignment: .topTrailing)
                            .position(x: 217, y: 47)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                        
                    default:
                        Text("Error #F-Size M07-1-1")
                    }
                    
                    // DayNumber 1
                    switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))).count {
                        
                    case ...5:
                        Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))))")
                            .font(.custom("Inter-Bold", size: 109.0))
                            .frame(width: 400, height: 100, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .position(x: 193, y: 93)
                            .kerning(-10)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                            .clipped()
                        
                    case 6...:
                        Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))))")
                            .font(.custom("Inter-Bold", size: 95.0))
                            .frame(width: 400, height: 100, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .position(x: 193, y: 105)
                            .kerning(-9)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                            .clipped()
                        
                    default:
                        Text("Error #F-Count M07-1-1")
                    }
                    
                }
                .frame(width: 312, height: 145)
                .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
            }
            .position(x: 165, y: 100)
            
            
            
            // top stack 2
            ZStack {
                
                // 2
                ZStack {
                    // Title 2
                    switch (ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...5:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 30.0))
                            .frame(width: 230, height: 70, alignment: .topLeading)
                            .position(x: 133, y: 51)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 6...10:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 25.0))
                            .frame(width: 230, height: 70, alignment: .topLeading)
                            .position(x: 133, y: 51)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 20.0))
                            .frame(width: 230, height: 70, alignment: .topLeading)
                            .position(x: 133, y: 51)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 17.0))
                            .frame(width: 200, height: 70, alignment: .topLeading)
                            .position(x: 118, y: 51)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    default:
                        Text("Error #F-Size M07-1-2")
                    }
                    
                    
                    // Date 2
                    Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2024.05.28")
                        .font(.custom("Inter-Bold", size: 16.0))
                        .frame(width: 100, height: 50, alignment: .topTrailing)
                        .position(x: 300, y: 42)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                    
                    // DayNumber 2
                    Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))))")
                        .font(.custom("Inter-Bold", size: 100.0))
                        .frame(width: 390, height: 100, alignment: .topTrailing)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 173, y: 70)
                        .kerning(-9)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        .clipped()
                }
                .frame(width: 390, height: 116)
                .border(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"), width: 6)
            }
            .position(x: 560, y: 101)
            
            
            
            // bottom stack 1
            ZStack {
                
                // 3
                ZStack {
                    // Date 3
                    Text(ddaySymbolMenu[safe: 2]?.ddayDate ?? "2024.05.28")
                        .font(.custom("Inter-Bold", size: 16.0))
                        .frame(width: 100, height: 30, alignment: .topLeading)
                        .position(x: 85, y: 35)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                    
                    // Title 3
                    switch (ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...4:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 39.0))
                            .frame(width: 100, height: 180, alignment: .topTrailing)
                            .position(x: 284, y: 106)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 5:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 30.0))
                            .frame(width: 110, height: 180, alignment: .topTrailing)
                            .position(x: 284, y: 106)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 6...10:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 25.0))
                            .frame(width: 110, height: 180, alignment: .topTrailing)
                            .position(x: 284, y: 106)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 22.0))
                            .frame(width: 110, height: 180, alignment: .topTrailing)
                            .position(x: 285, y: 106)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 17.0))
                            .frame(width: 110, height: 180, alignment: .topTrailing)
                            .position(x: 286, y: 106)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    default:
                        Text("Error #F-Size M07-1-3")
                    }
                    
                    
                    // DayNumber 3
                    switch CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))).count {

                    case ...5:
                        Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))))")
                            .font(.custom("Inter-Bold", size: 95.0))
                            .frame(width: 340, height: 100, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .position(x: 176, y: 80)
                            .kerning(-9)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            .clipped()

                    case 6...:
                        Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))))")
                            .font(.custom("Inter-Bold", size: 89.0))
                            .frame(width: 340, height: 100, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .position(x: 174, y: 83)
                            .kerning(-8)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            .clipped()

                    default:
                        Text("Error #F-Count M07-1-3")
                    }
                    
                }
                .frame(width: 357, height: 123)
                .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 6)
            }
            .position(x: 176, y: 265)
            
            
            
            // bottom stack 2
            ZStack {
                
                // 4
                ZStack {
                    
                    // Title 4
                    switch (ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    case ...4:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 39.0))
                            .frame(width: 200, height: 140, alignment: .topLeading)
                            .position(x: 115, y: 85)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                        
                    case 5:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 30.0))
                            .frame(width: 200, height: 140, alignment: .topLeading)
                            .position(x: 115, y: 85)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                        
                    case 6...10:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 25.0))
                            .frame(width: 200, height: 140, alignment: .topLeading)
                            .position(x: 115, y: 85)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))

                    case 11...15:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 22.0))
                            .frame(width: 200, height: 140, alignment: .topLeading)
                            .position(x: 115, y: 85)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                        
                    case 16...:
                        Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 18.0))
                            .frame(width: 200, height: 140, alignment: .topLeading)
                            .position(x: 115, y: 86)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                        
                    default:
                        Text("Error #F-Size M07-1-3")
                    }
                    
                    
                    
                    // Date 4
                    Text(ddaySymbolMenu[safe: 3]?.ddayDate ?? "2024.05.28")
                        .font(.custom("Inter-Bold", size: 16.0))
                        .frame(width: 100, height: 50, alignment: .topTrailing)
                        .position(x: 263, y: 42)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                    
                    
                    // DayNumber 4
                    Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"))))")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 400, height: 100, alignment: .topTrailing)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 130, y: 94)
                        .kerning(-10)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                        .clipped()
                }
                .frame(width: 355, height: 148)
                .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
            }
            .position(x: 580, y: 263)
        }
        .frame(width: 750, height: 360)
        .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
        
        
    }
}
