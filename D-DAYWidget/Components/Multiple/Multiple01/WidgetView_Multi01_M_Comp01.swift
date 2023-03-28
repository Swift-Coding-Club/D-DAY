//
//  WidigetView_Multi01_M_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

struct WidgetView_Multi01_M_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        // 0. Default Array for the variable 'defaultDdaySymbolMenu'
        let defaultStringArr: [[String]] = [
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor, ddayIsCountdown]
            ["길게눌러서 디데이 추가하기", "2023.08.04", "ddayBlack", "ddayLemon", "false"],
            ["길게눌러서 디데이 추가하기", "2023.06.04", "ddayWhite", "ddayBlack", "false"],
            ["길게눌러서 디데이 추가하기", "2023.03.04", "ddayWhite", "ddayBlack", "false"],
            ["길게눌러서 디데이 추가하기", "2023.04.04", "ddayBlack", "ddayLemon", "false"],
        ]
        
        // 1. 위젯 초기(tableview list읽어온 데이터 없을시) 보여지는 default CustomSymbol array
        let defaultDdaySymbolMenu: [DdaySymbol] = defaultStringArr.map { sArray in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = sArray[0]
            symbolDdayItem.ddayDate = sArray[1]
            symbolDdayItem.ddayBgColor = sArray[2]
            symbolDdayItem.ddayTxtColor = sArray[3]
            symbolDdayItem.ddayIsCountdown = sArray[4]
            
            return symbolDdayItem
        }
        
        // 2. 위젯 편집후 불러오는 CustomSymbol array
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 0) {
                ZStack(alignment: .bottom) {
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0))
                        .frame(width: 200, height: 50, alignment: .topLeading)
                        .position(x: 116, y: 85)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 28, height: 50, alignment: .topLeading)
                        .position(x: 30, y: 123)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                    
                    ZStack {
                        Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  defaultStringArr[0][1]), isTodayCounted: ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false")))")
                            .font(.custom("Inter-ExtraBold", size: 56.0))
                            .frame(width: 128, height: 49, alignment: .topTrailing)
                            .position(x: 65, y: 21)
                            .kerning(-5)
                            .clipped()
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                    }
                    .frame(width: 130, height: 49, alignment: .bottomTrailing)
                    .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                    
                }
                .position(x: 168, y: 65)
                .frame(width: 230, height: 130)
                .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                
                
                ZStack(alignment: .bottom) {
                    Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0))
                        .frame(width: 200, height: 50, alignment: .topTrailing)
                        .position(x: 110, y: 85)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                    
                    Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 28, height: 50, alignment: .topTrailing)
                        .position(x: 198, y: 123)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                    
                    ZStack {
                        Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  defaultStringArr[1][1]), isTodayCounted: ddaySymbolMenu[safe: 1]?.ddayIsCountdown ?? "false")))")
                            .font(.custom("Inter-ExtraBold", size: 56.0))
                            .frame(width: 135, height: 49, alignment: .topLeading)
                            .position(x: 64, y: 21)
                            .kerning(-5)
                            .clipped()
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                    }
                    .frame(width: 130, height: 49, alignment: .bottomLeading)
                    .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                }
                .position(x: 65, y: 65)
                .frame(width: 230, height: 130)
                .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
            }
            
            
            HStack(alignment: .top, spacing: 0) {
                ZStack(alignment: .top) {
                    Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0))
                        .frame(width: 200, height: 50, alignment: .topLeading)
                        .position(x: 116, y: 80)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                    
                    Text(ddaySymbolMenu[safe: 2]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 28, height: 50, alignment: .topLeading)
                        .position(x: 30, y: 35)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                    
                    ZStack {
                        Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  defaultStringArr[2][1]), isTodayCounted: ddaySymbolMenu[safe: 2]?.ddayIsCountdown ?? "false")))")
                            .font(.custom("Inter-ExtraBold", size: 56.0))
                            .frame(width: 135, height: 49, alignment: .topLeading)
                            .position(x: 61, y: 21)
                            .kerning(-5)
                            .clipped()
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                    }
                    .frame(width: 130, height: 49, alignment: .bottomLeading)
                    .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"))
                }
                .position(x: 168, y: 65)
                .frame(width: 230, height: 130)
                .background(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayWhite"))
                
                
                ZStack(alignment: .top) {
                    Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0))
                        .frame(width: 200, height: 50, alignment: .topTrailing)
                        .position(x: 110, y: 80)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                    
                    Text(ddaySymbolMenu[safe: 3]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 28, height: 50, alignment: .topTrailing)
                        .position(x: 200, y: 35)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                    
                    ZStack {
                        Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  defaultStringArr[3][1]), isTodayCounted: ddaySymbolMenu[safe: 3]?.ddayIsCountdown ?? "false")))")
                            .font(.custom("Inter-ExtraBold", size: 56.0))
                            .frame(width: 135, height: 49, alignment: .topTrailing)
                            .position(x: 60, y: 23)
                            .kerning(-5)
                            .clipped()
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
                    }
                    .frame(width: 130, height: 49, alignment: .bottomTrailing)
                    .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayLemon"))
                }
                .position(x: 65, y: 65)
                .frame(width: 230, height: 130)
                .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
            }
        }
    }
}

