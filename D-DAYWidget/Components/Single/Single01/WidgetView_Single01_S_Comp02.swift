//
//  WidigetView_Single01_S_Comp02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/15.
//

import SwiftUI

struct WidgetView_Single01_S_Comp02: View { // enable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultDdaySymbolMenu: [DdaySymbol] = [0].map { index in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = "길게눌러서 디데이 추가하기"
            symbolDdayItem.ddayDate = "2023.06.24"
            symbolDdayItem.ddayBgColor = "ddayBlack"
            symbolDdayItem.ddayTxtColor = "ddayWhite"
            symbolDdayItem.ddayIsCountdown = "false"

            return symbolDdayItem
        }
            
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        let isTodayCounted: String = ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false"
        let dateInt = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2024.02.16"), isTodayCounted: isTodayCounted)
        let ddayDorPlus = CustomFunctions().ddaySetDorPlus(dateIntParam: dateInt)
        
        ZStack {
            ZStack() {
                
                // D or +
                switch ddayDorPlus {
                case "D":
                    Text("D")
                        .position(x: 7, y: -20)
                        .frame(width: 85, height: 36, alignment: .leading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .font(.custom("Inter-Bold", size: 100))
                        .rotationEffect(.degrees(-13))
                        .multilineTextAlignment(.leading)
                    
                case "+":
                    Text("+")
                        .position(x: 3, y: -30)
                        .frame(width: 85, height: 36, alignment: .leading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .font(.custom("Inter-Bold", size: 133))
                        .rotationEffect(.degrees(-13))
                        .multilineTextAlignment(.leading)
                    
                default:
                    Text("Encountered Error S01-1-1")
                }
                
                
                // Title
                switch ddaySymbolMenu[safe: 0]!.ddayTitle!.count {
                case ...2:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 37, trailing: -50))
                        .font(.custom("Inter-Bold", size: 17.0))
                        .multilineTextAlignment(.trailing)
                    
                case 3...5:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 37, trailing: -60))
                        .font(.custom("Inter-Bold", size: 16.0))
                        .multilineTextAlignment(.trailing)
                    
                case 6...9:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: -60))
                        .font(.custom("Inter-Bold", size: 15.0))
                        .multilineTextAlignment(.trailing)
                    
                case 10...12:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: -60))
                        .font(.custom("Inter-Bold", size: 14.0))
                        .multilineTextAlignment(.trailing)
                
                case 13...:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: -60))
                        .font(.custom("Inter-Bold", size: 12.0))
                        .multilineTextAlignment(.trailing)
                    
                default:
                    Text("Encountered Error S01-1-2")
                }
                
            }
            .position(x: 80,y: 64)
            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
            
            
            // DayNumber
            let dateNumber = CustomFunctions().dateIntSign(dateIntParam: dateInt)
            switch dateNumber.count {
                
            case 2:
                Text("\(dateNumber)")
                    .frame(width: 180, alignment: .leading)
                    .font(.custom("Inter-Bold", size: 118.0))
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .multilineTextAlignment(.leading)
                    .kerning(-10)
                    .rotationEffect(.degrees(-10))
                    .position(x: 82, y: 108)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
            case 3:
                
                switch Int(dateNumber)! / 100 {
                case 1:
                    Text("\(dateNumber)")
                        .frame(width: 230, alignment: .leading)
                        .font(.custom("Inter-Bold", size: 110.0))
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .multilineTextAlignment(.leading)
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .position(x: 106, y: 108)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    
                case 2:
                    Text("\(dateNumber)")
                        .frame(width: 230, alignment: .leading)
                        .font(.custom("Inter-Bold", size: 100.0))
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .multilineTextAlignment(.leading)
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .position(x: 105, y: 108)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    
                case 3...8 :
                    Text("\(dateNumber)")
                        .frame(width: 230, alignment: .leading)
                        .font(.custom("Inter-Bold", size: 106.0))
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .multilineTextAlignment(.leading)
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .position(x: 104, y: 108)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    
                case 9 :
                    Text("\(dateNumber)")
                        .frame(width: 230, alignment: .leading)
                        .font(.custom("Inter-Bold", size: 99.0))
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .multilineTextAlignment(.leading)
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .position(x: 105, y: 108)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    
                default:
                    Text("Default Error S01-1-2-01")
                }
                
            case 4:
                    switch Int(dateNumber)! / 1000 {
                    case 1:
                        Text("\(dateNumber)")
                            .frame(width: 270, alignment: .leading)
                            .font(.custom("Inter-Bold", size: 79.0))
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .multilineTextAlignment(.leading)
                            .kerning(-8)
                            .rotationEffect(.degrees(-10))
                            .position(x: 124, y: 108)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                        
                    case 2:
                        Text("\(dateNumber)")
                            .frame(width: 230, alignment: .leading)
                            .font(.custom("Inter-Bold", size: 76.0))
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .multilineTextAlignment(.leading)
                            .kerning(-8)
                            .rotationEffect(.degrees(-10))
                            .position(x: 105, y: 110)
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                        
                    case 3...9 :
                            Text("\(dateNumber)")
                                .frame(width: 400, alignment: .leading)
                                .font(.custom("Inter-Bold", size: 75.0))
                                .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                                .multilineTextAlignment(.leading)
                                .kerning(-6)
                                .rotationEffect(.degrees(-10))
                                .position(x: 188, y: 98)
                                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                                
                    default:
                        Text("Default Error S01-1-2-02")
                    }
                
            case 5...:
                Text("\(dateNumber)")
                    .frame(width: 400, alignment: .leading)
                    .font(.custom("Inter-Bold", size: 60.0))
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .multilineTextAlignment(.leading)
                    .kerning(-6)
                    .rotationEffect(.degrees(-10))
                    .position(x: 192, y: 90)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                
            default:
                Text("Encountered Error S01-1-3")
            }
        }
        .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
    }
}
