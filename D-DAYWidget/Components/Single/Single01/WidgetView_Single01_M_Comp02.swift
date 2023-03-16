//
//  WidigetView_Single01_M_Comp02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/15.
//

import SwiftUI

struct WidgetView_Single01_M_Comp02: View { // enable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        let defaultDdaySymbolMenu: [DdaySymbol] = [
            DdaySymbol(identifier: "ddayNeonGreen", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayBlack", subtitle: "2021.12.18", image: nil),
        ]
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        var dateInt = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.subtitleString ??  "2022.02.16"))
        
        ZStack {
            ZStack {
                Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                    .font(.custom("Inter-Bold", size: 13.0)) // 많-12, 길게눌러-13
                    .frame(width: 200, height: 20, alignment: .topLeading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 110, trailing: 110))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                
                let ddayNumber = CustomFunctions().dateIntSign(dateIntParam: dateInt)
                let startIndex = ddayNumber.index(ddayNumber.startIndex, offsetBy: 1)
                let dayStr = String(ddayNumber[...startIndex]) // D+ / D-
                
                switch dateInt <= 0 {
                case true :
                    switch ddayNumber.count {
                    case 2...3:
                        Text("D-\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 128.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-13)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                    case 4:
                        Text("D-\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 114.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-11)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                    case 5...8:
                        Text("D-\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 100.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-11)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                    default:
                        Text("Default E4")
                    }
                    
                case false :
                    switch ddayNumber.count {
                    case 2:
                        Text("D+")
                            .font(.custom("Inter-Bold", size: 128.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-15)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                        Text("\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 128.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .padding(EdgeInsets(top: 15, leading: 343, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-13)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                    case 3:
                        
                        switch Int(ddayNumber)! / 100 {
                        case 1:
                            Text("D+")
                                .font(.custom("Inter-Bold", size: 128.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                                .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-15)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                            Text("\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 128.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                                .padding(EdgeInsets(top: 15, leading: 336, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-13)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                        case 2...9:
                            Text("D+")
                                .font(.custom("Inter-Bold", size: 124.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                                .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-15)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                            Text("\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 120.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                                .padding(EdgeInsets(top: 15, leading: 329, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-12)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                        default:
                            Text("Default E3")
                        }
                        
                        
                    case 4...8:
                        Text("D")
                            .font(.custom("Inter-Bold", size: 113.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                        Text("+")
                            .font(.custom("Inter-ExtraBold", size: 87.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .padding(EdgeInsets(top: 15, leading: 182, bottom: 11, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                        Text("\(ddayNumber)")
                            .font(.custom("Inter-Bold", size: 109.0))
                            .frame(width: 400, height: 100, alignment: .leading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .padding(EdgeInsets(top: 15, leading: 271, bottom: 0, trailing: 0))
                            .multilineTextAlignment(.leading)
                            .kerning(-11)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                    default:
                        Text("Default error2")
                    }
                default:
                    Text("Default error1")
                }
                
                Text("2023.12.31")
                    .font(.custom("Inter-Bold", size: 10.0))
                    .frame(width: 300, height: 20, alignment: .trailing)
                    .padding(EdgeInsets(top: 120, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
            }
        }
        .frame(height: 200)
        .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonGreen"))
        
    }
}
