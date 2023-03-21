//
//  WidigetView_Multi03_L_Comp01_2.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/15.
//

import SwiftUI

struct WidgetView_Multi03_L_Comp01_2: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultStringArr: [[String]] = [
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor]
            ["길게눌러서 디데이 추가하기", "2024.01.04", "ddayNeonPink", "ddayNeonGreen"],
            ["길게눌러서 디데이 추가하기", "2024.02.04", "ddayNeonPink", "ddayNeonGreen"],
            ["길게눌러서 디데이 추가하기", "2023.02.04", "ddayNeonPink", "ddayNeonGreen"],
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
        
        var dateInt: Int = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.subtitleString ??  "2024.02.10"))
        var ddayDorPlus: String = CustomFunctions().ddaySetDorPlus(dateIntParam: dateInt)
        var _formattedDateInt: String = CustomFunctions().dateIntSign(dateIntParam: dateInt) // 296
        
        var txtStringArr: [String] = []
        var _dateCountArr: [Int] = [_formattedDateInt.count]
        
        let _: [String] = _dateCountArr.map { index in
            for n in 0..<index {
                let lastIndex = _formattedDateInt.index(_formattedDateInt.startIndex, offsetBy: n)
                txtStringArr.append(String(_formattedDateInt[lastIndex]))
            }
            return ""
        }
        
        ZStack {
            Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                .frame(width: 70, height: 55, alignment: .topTrailing)
                .multilineTextAlignment(.trailing)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
            
            Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2019.03.30")
                .font(.custom("Inter-Bold", size: 12.0))
                .rotationEffect(.degrees(-90))
                .frame(width: 70, height: 50, alignment: .topLeading)
                .padding(EdgeInsets(top: 295, leading: 0, bottom: 0, trailing: 45))
                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
            
            switch txtStringArr.count {
            case 0...3:
                Text("D")
                    .font(.custom("Inter-Bold", size: 93.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 70, y: 104)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(ddayDorPlus)")
                    .font(.custom("Inter-ExtraBold", size: 50.0))
                    .frame(width: 75, height: 20, alignment: .top)
                    .position(x: 37, y: 175)
                    .kerning(-6)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(txtStringArr[safe: 0] ?? "")")
                    .font(.custom("Inter-Bold", size: 95.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 71, y: 170)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(txtStringArr[safe: 1] ?? "")")
                    .font(.custom("Inter-Bold", size: 95.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 71, y: 231)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(txtStringArr[safe: 2] ?? "")")
                    .font(.custom("Inter-Bold", size: 95.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 71, y: 295)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
            default:
                Text("D")
                    .font(.custom("Inter-Bold", size: 80.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 78, y: 94)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(ddayDorPlus)")
                    .font(.custom("Inter-ExtraBold", size: 50.0))
                    .frame(width: 75, height: 20, alignment: .top)
                    .position(x: 45, y: 147)
                    .kerning(-6)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(txtStringArr[safe: 0] ?? "9")")
                    .font(.custom("Inter-Bold", size: 80.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 79, y: 149)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(txtStringArr[safe: 1] ?? "9")")
                    .font(.custom("Inter-Bold", size: 80.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 79, y: 204)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(txtStringArr[safe: 2] ?? "9")")
                    .font(.custom("Inter-Bold", size: 80.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 79, y: 259)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                
                Text("\(txtStringArr[safe: 3] ?? "9")")
                    .font(.custom("Inter-Bold", size: 80.0))
                    .frame(width: 55, height: 20, alignment: .top)
                    .position(x: 79, y: 314)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
            }
        }
        .frame(width: 80, height: 400)
        .background(Color(ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonPink"))
    }
}
