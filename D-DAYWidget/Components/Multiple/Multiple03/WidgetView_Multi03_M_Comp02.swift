//
//  WidigetView_Multi03_M_Comp02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

struct WidgetView_Multi03_M_Comp02: View { // enable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultStringArr: [[String]] = [
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor]
            ["길게눌러서 디데이 추가하기", "2024.01.04", "ddayNeonYellow", "ddayBlack"],
            ["길게눌러서 디데이 추가하기", "2023.10.04", "ddayNeonYellow", "ddayBlack"],
            ["길게눌러서 디데이 추가하기", "2023.03.14", "ddayNeonYellow", "ddayBlack"],
            ["길게눌러서 디데이 추가하기", "2024.03.14", "ddayNeonYellow", "ddayBlack"],
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
        
        ZStack{
            // top stack 1
            ZStack{
                Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2000.00.00")
                    .font(.custom("Inter-Bold", size: 7.0))
                    .frame(width: 60, height: 50, alignment: .topLeading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                
                Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .frame(width: 80, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 62, bottom: 1, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                
                Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.12.16"))))")
                        .font(.custom("Inter-Bold", size: 54.0))
                        .frame(width: 150, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .clipped()
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 0))
                        .kerning(-5)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
            }
            .frame(width: 155, height: 70)
            .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 75, trailing: 210))
            
            
            // top stack 2
            ZStack{
                Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 9.0)) // 4-12
                    .frame(width: 100, height: 50, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 65))
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                
                Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2000.00.00")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 60, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 5, leading: 95, bottom: 0, trailing: 0))
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                
                Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.12.16"))))")
                    .font(.custom("Inter-Bold", size: 54.0))
                    .frame(width: 150, height: 51, alignment: .topTrailing)
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .clipped()
                    .padding(EdgeInsets(top: 8, leading: 25, bottom: 0, trailing: 0))
                    .kerning(-5)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    .clipped()
            }
            .frame(width: 190, height: 66)
            .border(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayBlack"), width: 4)
            .padding(EdgeInsets(top: 0, leading: 170, bottom: 66, trailing: 0))
            
            
            // bottom stack 1
            ZStack{
                Text(ddaySymbolMenu[safe: 2]?.ddayDate ?? "2000.00.00")
                    .font(.custom("Inter-Bold", size: 7.0))
                    .frame(width: 60, height: 50, alignment: .topLeading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 90))
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                    
                Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 9.0)) // 많이-9, 4-12
                    .frame(width: 46, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 5, leading: 110, bottom: 0, trailing: 0))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                
                Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.12.16"))))")
                    .font(.custom("Inter-Bold", size: 54.0))
                    .frame(width: 170, height: 50, alignment: .topLeading)
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .clipped()
                    .padding(EdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 3))
                    .kerning(-5)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    .clipped()
            }
            .frame(width: 170, height: 60)
            .border(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"), width: 4)
            .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 180))
            
            
            // bottom stack 2
            ZStack{
                Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 8.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                    .frame(width: 70, height: 50, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                    
                
                Text(ddaySymbolMenu[safe: 3]?.ddayDate ?? "2000.00.00")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 60, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0))
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
                
                Text("\(CustomFunctions().makeSignedDateNumber(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.12.16"))))")
                    .font(.custom("Inter-Bold", size: 50.0))
                    .frame(width: 150, height: 47, alignment: .topTrailing)
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .clipped()
                    .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 22))
                    .kerning(-5)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
            }
            .frame(width: 185, height: 65)
            .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
            .padding(EdgeInsets(top: 84, leading: 210, bottom: 0, trailing: 0))
        }
        .frame(height: 200)
        .background(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonYellow"))
    }
}
