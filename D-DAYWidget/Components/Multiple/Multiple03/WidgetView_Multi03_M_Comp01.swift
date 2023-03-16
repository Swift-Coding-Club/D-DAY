//
//  WidigetView_Multi03_M_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

struct WidgetView_Multi03_M_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        
        let defaultDdaySymbolMenu: [DdaySymbol] = [
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayBlack", subtitle: "2050.01.01", image: nil),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
        ]
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        ZStack{
            // top stack 1
            ZStack{
                Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2099.02.28")
                    .font(.custom("Inter-Bold", size: 7.0))
                    .frame(width: 60, height: 50, alignment: .topLeading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                
                
                Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .frame(width: 80, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 62, bottom: 1, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                
                    Text("-999")
                        .font(.custom("Inter-Bold", size: 58.0))
                        .frame(width: 150, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 15, leading: 5, bottom: 0, trailing: 0))
                        .kerning(-5)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
            }
            .frame(width: 155, height: 70)
            .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 75, trailing: 210))
            
            
            // top stack 2
            ZStack{
                Text(ddaySymbolMenu[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 9.0)) // 4-12
                    .frame(width: 100, height: 50, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 65))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                
                
                Text(ddaySymbolMenu[safe: 1]?.subtitleString ?? "2099.02.28")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 60, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 5, leading: 95, bottom: 0, trailing: 0))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                
                Text("-999")
                    .font(.custom("Inter-Bold", size: 58.0))
                    .frame(width: 150, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 5, leading: 25, bottom: 0, trailing: 0))
                    .kerning(-5)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    .clipped()
            }
            .frame(width: 190, height: 63)
            .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 4)
            .padding(EdgeInsets(top: 0, leading: 170, bottom: 63, trailing: 0))
            
            
            // bottom stack 1
            ZStack{
                Text(ddaySymbolMenu[safe: 2]?.subtitleString ?? "2099.02.27")
                    .font(.custom("Inter-Bold", size: 7.0))
                    .frame(width: 60, height: 50, alignment: .topLeading)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 90))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    
                Text(ddaySymbolMenu[safe: 2]?.displayString ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 9.0)) // 많이-9, 4-12
                    .frame(width: 46, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 5, leading: 110, bottom: 0, trailing: 0))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                Text("+1")
                    .font(.custom("Inter-Bold", size: 54.0))
                    .frame(width: 170, height: 50, alignment: .topLeading)
                    .padding(EdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 3))
                    .kerning(-5)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    .clipped()
            }
            .frame(width: 170, height: 60)
            .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 4)
            .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 180))
            
            
            // bottom stack 2
            ZStack{
                Text(ddaySymbolMenu[safe: 3]?.displayString ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 8.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                    .frame(width: 70, height: 50, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    
                
                Text(ddaySymbolMenu[safe: 3]?.subtitleString ?? "2099.02.26")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 60, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    
                Text("+999")
                    .font(.custom("Inter-Bold", size: 58.0))
                    .frame(width: 150, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 7, leading: 0, bottom: 0, trailing: 22))
                    .kerning(-5)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
            }
            .frame(width: 185, height: 65)
            .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
            .padding(EdgeInsets(top: 84, leading: 210, bottom: 0, trailing: 0))
        }
        .frame(height: 200)
        .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
    }
}
