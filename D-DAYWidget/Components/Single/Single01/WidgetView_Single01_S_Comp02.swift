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
            symbolDdayItem.ddayDate = "2024.12.04"
            symbolDdayItem.ddayBgColor = "ddayBlack"
            symbolDdayItem.ddayTxtColor = "ddayWhite"

            return symbolDdayItem
        }
            
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        var dateInt = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2024.02.16"))
        var ddayDorPlus = CustomFunctions().ddaySetDorPlus(dateIntParam: dateInt)
        
        ZStack {
            ZStack() {
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
                
                
                
                
                
                ////////////// 확인!!!!!!!!!!!!!!!!!!!!!!
                switch ddaySymbolMenu[safe: 0]!.ddayTitle!.count {
                case ...10:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: -60))
                        .font(.custom("Inter-Bold", size: 12.0))
                        .multilineTextAlignment(.trailing)
                
                case 11...:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: -60))
                        .font(.custom("Inter-Bold", size: 10.0))
                        .multilineTextAlignment(.trailing)
                    
                default:
                    Text("Encountered Error S01-1-2")
                }
                
                
                
                
                
            }
            .position(x: 80,y: 64)
            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
            
            var dateNumber = CustomFunctions().dateIntSign(dateIntParam: dateInt)
            switch dateNumber.count {
            case 2:
                Text("\(dateNumber)")
                    .frame(width: 180, alignment: .leading)
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .font(.custom("Inter-Bold", size: 118.0)) // 124 - 107, 89 - 118
                    .multilineTextAlignment(.leading)
                    .kerning(-10)
                    .rotationEffect(.degrees(-10))
                    .position(x: 82, y: 108)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
            case 3:
                
                switch Int(dateNumber)! / 100 {
                case 1...2:
                    Text("\(dateNumber)")
                        .frame(width: 230, alignment: .leading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .font(.custom("Inter-Bold", size: 110.0)) // 124 - 107, 89 - 118
                        .multilineTextAlignment(.leading)
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .position(x: 106, y: 108)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    
                case 3...8 :
                    Text("\(dateNumber)")
                        .frame(width: 230, alignment: .leading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .font(.custom("Inter-Bold", size: 106.0)) // 124 - 107, 89 - 118
                        .multilineTextAlignment(.leading)
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .position(x: 104, y: 108)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    
                case 9 :
                    Text("\(dateNumber)")
                        .frame(width: 230, alignment: .leading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .font(.custom("Inter-Bold", size: 99.0)) // 124 - 107, 89 - 118
                        .multilineTextAlignment(.leading)
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .position(x: 105, y: 108)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    
                default:
                    Text("Default Error")
                }
                
            default:
                Text("Encountered Error S01-2-1")
            }
        }
        .background(Color(ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
    }
}
