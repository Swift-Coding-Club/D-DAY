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
        let defaultDdaySymbolMenu_sub: [DdaySymbol] = [
            DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2024.01.04", image: nil),
            DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2024.02.04", image: nil),
            DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2024.03.04", image: nil),
        ]
        
        let ddaySymbolMenu_sub: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu_sub
        
        var dateInt: Int = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu_sub[safe: 1]?.subtitleString ??  "2024.02.16"))
        var ddayDorPlus: String = CustomFunctions().ddaySetDorPlus(dateIntParam: dateInt)
        var _formattedDateInt: String = CustomFunctions().dateIntSign(dateIntParam: dateInt) // 296
        
        var txtStringArr: [String] = [ddayDorPlus]
        var _dateCountArr: [Int] = [_formattedDateInt.count]
        
        let _: [String] = _dateCountArr.map { index in
            for n in 0..<index {
                let lastIndex = _formattedDateInt.index(_formattedDateInt.startIndex, offsetBy: n)
                txtStringArr.append(String(_formattedDateInt[lastIndex]))
            }
            return ""
        }
        
        ZStack {
            Text(ddaySymbolMenu_sub[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                .font(.custom("Inter-Bold", size: 12.0)) // 4- 14, 3~5-12, <8=-11,  많이-9
                .frame(width: 70, height: 55, alignment: .topTrailing)
                .multilineTextAlignment(.trailing)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
            
            Text(ddaySymbolMenu_sub[safe: 1]?.subtitleString ?? "2019.09.28")
                .font(.custom("Inter-Bold", size: 12.0))
                .rotationEffect(.degrees(-90))
                .frame(width: 70, height: 50, alignment: .topLeading)
                .padding(EdgeInsets(top: 295, leading: 0, bottom: 0, trailing: 45))
                .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
            
            Text("\(txtStringArr[safe: 0] ?? "E")")
                .font(.custom("Inter-Bold", size: 95.0))
                .frame(width: 55, height: 20, alignment: .top)
                .position(x: 70, y: 104)
                .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
            Text("\(txtStringArr[safe: 1] ?? "")")
                .font(.custom("Inter-Bold", size: 95.0))
                .frame(width: 55, height: 20, alignment: .top)
                .position(x: 71, y: 170)
                .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
            Text("\(txtStringArr[safe: 2] ?? "")")
                .font(.custom("Inter-Bold", size: 95.0))
                .frame(width: 55, height: 20, alignment: .top)
                .position(x: 71, y: 231)
                .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
            Text("\(txtStringArr[safe: 3] ?? "")")
                .font(.custom("Inter-Bold", size: 95.0))
                .frame(width: 55, height: 20, alignment: .top)
                .position(x: 71, y: 295)
                .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
            
            
        }
        .frame(width: 80, height: 400)
        .background(Color(ddaySymbolMenu_sub[safe: 0]?.identifier ?? "ddayNeonPink"))
    }
}
