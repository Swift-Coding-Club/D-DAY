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
        
        let defaultDdaySymbolMenu: [DdaySymbol] = [
            DdaySymbol(identifier: "ddayNeonBlue", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonYellow", subtitle: "2050.01.01", image: nil),
        ]
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        ZStack {
            ZStack {
                Text("D")
                    .font(.custom("Inter-Bold", size: 225.0))
                    .frame(width: 230, height: 36, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 233, trailing: 70))
                //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                    .rotationEffect(.degrees(-13))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)

                Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 17.0))
                    .frame(width: 110, height: 100, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 170, bottom: 200, trailing: 0))
                    .multilineTextAlignment(.trailing)
                    .lineSpacing(2)
                    .lineLimit(3)
                    .foregroundColor(.black)

                Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                    .font(.custom("Inter-Bold", size: 10.0))
                    .frame(width: 110, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 170, bottom: 100, trailing: 0))
                    .multilineTextAlignment(.trailing)
                    .lineSpacing(2)
                    .foregroundColor(.black)

                Text("124")
                    .font(.custom("Inter-Bold", size: 223.0)) // 223- 124,
                    .frame(width: 450, alignment: .leading)
                    .padding(EdgeInsets(top: 160, leading: 60, bottom: 0, trailing: 0))
                //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                    .multilineTextAlignment(.leading)
                    .kerning(-19) // 124- 16, 24 - 19
                    .rotationEffect(.degrees(-11))
                    .foregroundColor(Color.black)
            }
        }
        .frame(height: 400)
        .background(Color.white)
    }
}
