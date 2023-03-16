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
        let defaultDdaySymbolMenu: [DdaySymbol] = [
            DdaySymbol(identifier: "ddayNeonBlue", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonYellow", subtitle: "2050.01.01", image: nil),
        ]
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        ZStack {
            ZStack {
                Text("Dday")
                    .font(.custom("Inter-Bold", size: 70.0))
                    .frame(width: 300, height: 50, alignment: .topLeading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 175, trailing: 20))
                    .kerning(-2)
                    .rotationEffect(.degrees(-13))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonYellow"))

                Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 14.0)) // 4글자(미국여행)-25, 5>-
                    .frame(width: 75, height: 70, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 230, bottom: 50, trailing: 0))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonYellow"))

                Text("999")
                    .font(.custom("Inter-Bold", size: 137.0)) // 000-130, 124-145, 999-137
                    .frame(width: 350, height: 100, alignment: .leading)
                    .padding(EdgeInsets(top: 40, leading: 60, bottom: 0, trailing: 0))
                    .multilineTextAlignment(.trailing)
                    .kerning(-12) // 000-12, 124- 11
                    .rotationEffect(.degrees(-8))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonYellow"))
                
                Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                    .font(.custom("Inter-Bold", size: 10.0))
                    .frame(width: 30, height: 70, alignment: .trailing)
                    .padding(EdgeInsets(top: 100, leading: 270, bottom: 0, trailing: 0))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonYellow"))
            }

        }
        .frame(height: 200)
        .background(Color("ddayNeonBlue"))
    }
}
