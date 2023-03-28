//
//  WidigetView_Single01_M_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/15.
//

import SwiftUI

struct WidgetView_Single01_M_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultDdaySymbolMenu: [DdaySymbol] = [0].map { index in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = "길게눌러서 디데이 추가하기"
            symbolDdayItem.ddayDate = "2025.12.25"
            symbolDdayItem.ddayBgColor = "ddayWhite"
            symbolDdayItem.ddayTxtColor = "ddayBlack"
            symbolDdayItem.ddayIsCountdown = "false"

            return symbolDdayItem
        }
            
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        let isTodayCounted: String = ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false"
        let dateInt = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2024.02.16"), isTodayCounted: isTodayCounted)
        
        
        ZStack {
            ZStack {
            
                // Title
                switch (ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                case ...5:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 20.0))
                        .frame(width: 200, height: 20, alignment: .topLeading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 105, trailing: 103))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                case 6...10:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 18.0))
                        .frame(width: 200, height: 20, alignment: .topLeading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 105, trailing: 107))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                case 11...14:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0))
                        .frame(width: 200, height: 20, alignment: .topLeading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 105, trailing: 107))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                case 15...:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 14.0))
                        .frame(width: 200, height: 80, alignment: .topLeading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: 110))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                default:
                    Text("Default E S01-1-0")
                    
                }
                
                
                let ddayNumber = CustomFunctions().dateIntSign(dateIntParam: dateInt)
                let startIndex = ddayNumber.index(ddayNumber.startIndex, offsetBy: 1)
                
                // DayNumber
                switch dateInt <= 0 {
                case true :
                    switch ddayNumber.count {
                    case 2...3:
                        Text("D-\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 128.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-13)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 4:
                        Text("D-\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 114.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-11)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 5...:
                        Text("D-\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 100.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-10)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    default:
                        Text("Default E S01-1-1")
                    }
                    
                case false :
                    switch ddayNumber.count {
                    case 2:
                        Text("D+")
                            .font(.custom("Inter-Bold", size: 128.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-13)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                        Text("\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 128.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 352, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-13)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 3:
                        
                        switch Int(ddayNumber)! / 100 {
                        case 1:
                            Text("D+")
                                .font(.custom("Inter-Bold", size: 128.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-15)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                            Text("\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 128.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 336, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-13)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                        case 2...9:
                            Text("D+")
                                .font(.custom("Inter-Bold", size: 124.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-15)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                            Text("\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 120.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 329, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-12)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                        default:
                            Text("Default ES01-1-2")
                        }
                        
                        
                    case 4:
                        Text("D")
                            .font(.custom("Inter-Bold", size: 113.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                        Text("+")
                            .font(.custom("Inter-ExtraBold", size: 87.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 182, bottom: 11, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                        Text("\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 109.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 271, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-11)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    case 5...:
                        Text("D")
                            .font(.custom("Inter-Bold", size: 105.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                        Text("+")
                            .font(.custom("Inter-ExtraBold", size: 82.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 175, bottom: 11, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                        Text("\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 93.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 266, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-11)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        
                    default:
                        Text("Default error S01-1-3")
                    }
                    
                default:
                    Text("Default Error S01-1")
                }
                
                
                // Date
                Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2023.12.31")
                    .font(.custom("Inter-Bold", size: 13.0))
                    .frame(width: 300, height: 20, alignment: .trailing)
                    .padding(EdgeInsets(top: 115, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
            }
        }
        .frame(height: 200)
        .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayWhite"))
    }
}
