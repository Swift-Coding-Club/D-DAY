//
//  WidgetView_Multi07_XL_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/16.
//

import SwiftUI

struct WidgetView_Multi07_XL_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        let defaultDdaySymbolMenu: [DdaySymbol] = [
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayBlack", subtitle: "2050.01.01", image: nil),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
        ]
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        ZStack {
            // top stack 1
            ZStack {
                ZStack {
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2099.02.28")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .frame(width: 100, height: 30, alignment: .topLeading)
                        .position(x: 75, y: 35)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    
                    
                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0))
                        .frame(width: 155, height: 50, alignment: .topTrailing)
                        .position(x: 212, y: 42)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    
                    Text("-999")
                        .font(.custom("Inter-Bold", size: 109.0))
                        .frame(width: 400, height: 100, alignment: .topLeading)
                        .position(x: 193, y: 93)
                        .kerning(-10)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .clipped()
                }
                .frame(width: 312, height: 145)
                .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
            }
            .position(x: 165, y: 100)
            
            // top stack 2
            ZStack {
                ZStack {
                    Text(ddaySymbolMenu[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0)) // 4-12
//                        Text("길게눌러서 자리매김한")
//                            .font(.custom("Inter-Bold", size: 25.0)) // 4-12
                        .frame(width: 230, height: 70, alignment: .topLeading)
                        .position(x: 133, y: 51)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    Text(ddaySymbolMenu[safe: 1]?.subtitleString ?? "2099.02.28")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .frame(width: 100, height: 50, alignment: .topTrailing)
                        .position(x: 300, y: 42)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    
                    Text("+9")
                        .font(.custom("Inter-Bold", size: 100.0))
                        .frame(width: 360, height: 100, alignment: .topTrailing)
                        .position(x: 187, y: 70)
                        .kerning(-10)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        .clipped()
                }
                .frame(width: 390, height: 116)
                .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 6)
            }
            .position(x: 560, y: 101)
            
            // bottom stack 1
            ZStack {
                ZStack {
                    Text(ddaySymbolMenu[safe: 2]?.subtitleString ?? "2024.02.27")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .frame(width: 100, height: 30, alignment: .topLeading)
                        .position(x: 85, y: 35)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    Text(ddaySymbolMenu[safe: 2]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0))
//                        Text("유학준비")
//                            .font(.custom("Inter-Bold", size: 28.0)) // 2-38
                        .frame(width: 98, height: 180, alignment: .topTrailing)
                        .position(x: 284, y: 106)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    Text("+324")
                        .font(.custom("Inter-Bold", size: 95.0))
//                        Text("+9990")
//                            .font(.custom("Inter-Bold", size: 85.0)) // 글자 ~4개 일때
//                            .kerning(-8)
                        .frame(width: 340, height: 100, alignment: .topLeading)
                        .position(x: 176, y: 80)
                        .kerning(-9)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        .clipped()
                    
                }
                .frame(width: 357, height: 123)
                .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 6)
            }
            .position(x: 176, y: 265)
            
            // bottom stack 2
            ZStack {
                ZStack {
                    Text(ddaySymbolMenu[safe: 3]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0)) // 4-12
//                        Text("길게눌러서")
//                            .font(.custom("Inter-Bold", size: 25.0)) // 4-12
//                        Text("유학준비하기")
//                            .font(.custom("Inter-Bold", size: 35.0)) // ~6
                        .frame(width: 200, height: 140, alignment: .topLeading)
                        .position(x: 121, y: 85)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    
                    Text(ddaySymbolMenu[safe: 1]?.subtitleString ?? "2024.05.28")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .frame(width: 100, height: 50, alignment: .topTrailing)
                        .position(x: 263, y: 42)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    
                    
                    Text("+862")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 400, height: 100, alignment: .topTrailing)
                        .position(x: 130, y: 94)
                        .kerning(-10)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .clipped()
                }
                .frame(width: 355, height: 148)
                .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
            }
            .position(x: 580, y: 263)
        }
        .frame(width: 750, height: 360)
        .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
    }
}
