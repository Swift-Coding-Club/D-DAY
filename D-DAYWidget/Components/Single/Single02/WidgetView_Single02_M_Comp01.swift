//
//  WidgetView_Single02_M_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/15.
//

import SwiftUI

struct WidgetView_Single02_M_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultDdaySymbolMenu: [DdaySymbol] = [0].map { index in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = "길게눌러 디데이 추가하기"
            symbolDdayItem.ddayDate = "2023.09.24"
            symbolDdayItem.ddayBgColor = "ddayNeonBlue"
            symbolDdayItem.ddayTxtColor = "ddayNeonYellow"
            symbolDdayItem.ddayLanguage = "English"

            return symbolDdayItem
        }
            
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        let dateInt = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2024.02.16"))
        let unsignedDateInt = CustomFunctions().dateIntSign(dateIntParam: dateInt)
        
        
        ZStack {
            ZStack {
                
                // Language
                switch (ddaySymbolMenu[safe: 0]?.ddayLanguage ?? "English") {
                case "English":
                    
                    switch dateInt <= 0 {
                    case true:
                        Text("Dday")
                            .font(.custom("Inter-Bold", size: 70.0))
                            .frame(width: 300, height: 50, alignment: .topLeading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 175, trailing: 20))
                            .kerning(-2)
                            .rotationEffect(.degrees(-13))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    case false:
                        Text("Day+")
                            .font(.custom("Inter-Bold", size: 70.0))
                            .frame(width: 300, height: 50, alignment: .topLeading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 175, trailing: 20))
                            .kerning(-2)
                            .rotationEffect(.degrees(-13))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    default:
                        Text("Encountered Error S02-1-1-01")
                        
                    }
                    
                case "Korean":
                    
                    switch dateInt <= 0 {
                    case true:
                        Text("디데이")
                            .font(.custom("Inter-Bold", size: 65.0))
                            .frame(width: 300, height: 50, alignment: .topLeading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 150, trailing: 24))
                            .kerning(-2)
                            .rotationEffect(.degrees(-12))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    case false:
                        Text("데이+")
                            .font(.custom("Inter-Bold", size: 65.0))
                            .frame(width: 300, height: 50, alignment: .topLeading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 150, trailing: 20))
                            .kerning(-2)
                            .rotationEffect(.degrees(-12))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    default:
                        Text("Encountered Error S02-1-1-02")
                        
                    }
                    
                case "Japanese":
                    
                    switch dateInt <= 0 {
                    case true:
                        Text("何日前")
                            .font(.custom("Inter-Bold", size: 60.0))
                            .frame(width: 300, height: 50, alignment: .topLeading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 140, trailing: 30))
                            .kerning(-3)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    case false:
                        Text("何日後")
                            .font(.custom("Inter-Bold", size: 60.0))
                            .frame(width: 300, height: 50, alignment: .topLeading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 140, trailing: 30))
                            .kerning(-3)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    default:
                        Text("Encountered Error S02-1-1-03")
                        
                    }
                    
                default:
                    Text("Encountered Error S02-1-2")
                }

                
                // Title
                switch (ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    
                case 0...4:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 28.0))
                        .frame(width: 70, height: 70, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 235, bottom: 50, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                    
                case 5...6:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 20.0))
                        .frame(width: 75, height: 70, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 230, bottom: 50, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                    
                case 7...10:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 17.0))
                        .frame(width: 75, height: 70, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 230, bottom: 50, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                    
                case 11...:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 14.0))
                        .frame(width: 75, height: 70, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 230, bottom: 50, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                    
                default:
                    Text("Encountered Error S02-1-3")
                    
                }
                
                
                // DayNumber
                switch unsignedDateInt.count {
                    
                case 0...1:
                    Text("\(unsignedDateInt)")
                        .font(.custom("Inter-Bold", size: 140.0)) 
                        .frame(width: 350, height: 100, alignment: .leading)
                        .padding(EdgeInsets(top: 40, leading: 75, bottom: 0, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .kerning(-12) // 000-12, 124- 11
                        .rotationEffect(.degrees(-8))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                                            
                    
                case 2...3:
                    
                    switch Int(unsignedDateInt)! / 100 {
                    case 0:
                        Text("\(unsignedDateInt)")
                            .font(.custom("Inter-Bold", size: 147.0))
                            .frame(width: 350, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 42, leading: 75, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.trailing)
                            .kerning(-12)
                            .rotationEffect(.degrees(-8))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                                                                                
                        
                    case 1...2:
                        Text("\(unsignedDateInt)")
                            .font(.custom("Inter-Bold", size: 138.0))
                            .frame(width: 350, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 40, leading: 60, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.trailing)
                            .kerning(-12)
                            .rotationEffect(.degrees(-8))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                                                                                
                        
                    case 3...6:
                        Text("\(unsignedDateInt)")
                            .font(.custom("Inter-Bold", size: 137.0))
                            .frame(width: 350, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 40, leading: 60, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.trailing)
                            .kerning(-12)
                            .rotationEffect(.degrees(-8))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    case 7:
                        Text("\(unsignedDateInt)")
                            .font(.custom("Inter-Bold", size: 139.0))
                            .frame(width: 350, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 40, leading: 60, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.trailing)
                            .kerning(-12)
                            .rotationEffect(.degrees(-8))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                        
                    case 8...9:
                        Text("\(unsignedDateInt)")
                            .font(.custom("Inter-Bold", size: 137.0))
                            .frame(width: 350, height: 100, alignment: .leading)
                            .padding(EdgeInsets(top: 40, leading: 60, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.trailing)
                            .kerning(-12)
                            .rotationEffect(.degrees(-8))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
                                                                                
                        
                    default:
                        Text("Encountered Error S02-1-4")
                    }
                    
                default:
                    Text("Encountered Error S02-1-2")
                    
                }
                
                
                // Date
                Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2023.12.28")
                    .font(.custom("Inter-Bold", size: 11.0))
                    .frame(width: 34, height: 70, alignment: .trailing)
                    .padding(EdgeInsets(top: 100, leading: 270, bottom: 0, trailing: 0))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonYellow"))
            }

        }
        .frame(height: 200)
        .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonBlue"))
        
    }
}
