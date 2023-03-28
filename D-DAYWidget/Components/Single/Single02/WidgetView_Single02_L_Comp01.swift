//
//  WidgetView_Single02_L_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/15.
//

import SwiftUI

struct WidgetView_Single02_L_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultDdaySymbolMenu: [DdaySymbol] = [0].map { index in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = "길게눌러서 디데이 추가하기"
            symbolDdayItem.ddayDate = "2023.08.24"
            symbolDdayItem.ddayBgColor = "ddayWhite"
            symbolDdayItem.ddayTxtColor = "ddayBlack"
            symbolDdayItem.ddayIsCountdown = "false"

            return symbolDdayItem
        }
            
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        let isTodayCounted: String = ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false"
        let dateInt = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2024.02.16"), isTodayCounted: isTodayCounted)
        let unsignedDateInt = CustomFunctions().dateIntSign(dateIntParam: dateInt)
        let ddayDorPlus = CustomFunctions().ddaySetDorPlus(dateIntParam: dateInt)
        
        
        ZStack {
            ZStack {
                
                // D or +
                switch ddayDorPlus {
                case "D":
                    Text("D")
                        .font(.custom("Inter-Bold", size: 225.0))
                        .frame(width: 230, height: 36, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 233, trailing: 70))
                        .rotationEffect(.degrees(-13))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                case "+":
                    Text("+")
                        .font(.custom("Inter-Bold", size: 315.0))
                        .frame(width: 230, height: 36, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 262, trailing: 108))
                        .rotationEffect(.degrees(-13))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                default:
                    Text("Encountered Error S02-2-1")
                    
                }
                
                
                // Title
                switch (ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                    
                case 0...4:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 29.0))
                        .frame(width: 130, height: 100, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 150, bottom: 175, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(2)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                case 5...6:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 26.0))
                        .frame(width: 130, height: 100, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 150, bottom: 175, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(2)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                case 7...10:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 23.0))
                        .frame(width: 130, height: 100, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 150, bottom: 185, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(2)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                case 11...:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 20.0))
                        .frame(width: 130, height: 100, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 150, bottom: 185, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(2)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                default:
                    Text("Encountered Error S02-2-2")
                    
                }


                // Date
                Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2023.12.28")
                    .font(.custom("Inter-Bold", size: 12.5))
                    .frame(width: 110, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 170, bottom: 102, trailing: 0))
                    .multilineTextAlignment(.trailing)
                    .lineSpacing(2)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))

                
                // DayNumber
                switch unsignedDateInt.count {
                case 0...2:
                    Text("\(unsignedDateInt)")
                        .font(.custom("Inter-Bold", size: 223.0)) 
                        .frame(width: 450, alignment: .leading)
                        .padding(EdgeInsets(top: 160, leading: 60, bottom: 0, trailing: 0))
                        .multilineTextAlignment(.leading)
                        .kerning(-19)
                        .rotationEffect(.degrees(-11))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                case 3:
                        
                        switch Int(unsignedDateInt)! / 100 {
                        case 1:
                            Text("\(unsignedDateInt)")
                                .font(.custom("Inter-Bold", size: 223.0))
                                .frame(width: 450, alignment: .leading)
                                .padding(EdgeInsets(top: 160, leading: 60, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-19)
                                .rotationEffect(.degrees(-11))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                        case 2:
                            Text("\(unsignedDateInt)")
                                .font(.custom("Inter-Bold", size: 208.0))
                                .frame(width: 450, alignment: .leading)
                                .padding(EdgeInsets(top: 154, leading: 43, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-19)
                                .rotationEffect(.degrees(-11))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                        case 3:
                            Text("\(unsignedDateInt)")
                                .font(.custom("Inter-Bold", size: 205.0))
                                .frame(width: 450, alignment: .leading)
                                .padding(EdgeInsets(top: 154, leading: 40, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-19)
                                .rotationEffect(.degrees(-11))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                        case 4:
                            Text("\(unsignedDateInt)")
                                .font(.custom("Inter-Bold", size: 207.0))
                                .frame(width: 450, alignment: .leading)
                                .padding(EdgeInsets(top: 160, leading: 26, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-19)
                                .rotationEffect(.degrees(-11))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                        case 5...6:
                            Text("\(unsignedDateInt)")
                                .font(.custom("Inter-Bold", size: 208.0))
                                .frame(width: 450, alignment: .leading)
                                .padding(EdgeInsets(top: 160, leading: 37, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-19)
                                .rotationEffect(.degrees(-11))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                        case 7:
                            Text("\(unsignedDateInt)")
                                .font(.custom("Inter-Bold", size: 209.0))
                                .frame(width: 450, alignment: .leading)
                                .padding(EdgeInsets(top: 160, leading: 58, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-19)
                                .rotationEffect(.degrees(-11))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                        case 8...9:
                            Text("\(unsignedDateInt)")
                                .font(.custom("Inter-Bold", size: 210.0))
                                .frame(width: 450, alignment: .leading)
                                .padding(EdgeInsets(top: 157, leading: 36, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-20)
                                .rotationEffect(.degrees(-11))
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                            
                        default:
                            Text("Encountered Error S02-2-3")
                            
                        }
                        
                    
                case 4...:
                    Text("\(unsignedDateInt)")
                        .font(.custom("Inter-Bold", size: 170.0))
                        .frame(width: 800, alignment: .leading)
                        .padding(EdgeInsets(top: 160, leading: 377, bottom: 0, trailing: 0))
                        .multilineTextAlignment(.leading)
                        .kerning(-16)
                        .rotationEffect(.degrees(-11))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                default:
                    Text("Encountered Error S02-2-4")
                    
                }
            }
        }
        .frame(height: 400)
        .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayWhite"))
    
    }
}
