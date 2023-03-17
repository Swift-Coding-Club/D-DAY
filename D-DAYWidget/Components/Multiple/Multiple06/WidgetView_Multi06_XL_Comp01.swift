//
//  WidgetView_Multi06_XL_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/16.
//

import SwiftUI

struct WidgetView_Multi06_XL_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        let defaultDdaySymbolMenu: [DdaySymbol] = [
            DdaySymbol(identifier: "ddayOrange", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonYellow", subtitle: "2050.01.01", image: nil),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
            DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
        ]
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 0) {
                ZStack(alignment: .bottom) {
                      Text("길게눌러서 디데이 추가하기") // 26
//                            Text("호주여행 준비 시작하는 단계 에 그때에어떻게 준비해야") // 21
//                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 26.0))
                        .frame(width: 330, height: 120, alignment: .topLeading)
                        .position(x: 168, y: 104)
                        .foregroundColor(Color("ddayNeonYellow"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 40, height: 50, alignment: .topLeading)
                        .position(x: 22, y: 176)
                        .foregroundColor(Color("ddayNeonYellow"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    ZStack {
//                                Text("+9000")
//                                    .font(.custom("Inter-ExtraBold", size: 98.0))
//                                    .frame(width: 380, height: 49, alignment: .topTrailing)
//                                    .position(x: 97, y: 48)
//                                .kerning(-8)
                        Text("+99")
                            .font(.custom("Inter-ExtraBold", size: 120.0))
                            .frame(width: 380, height: 49, alignment: .topTrailing)
                            .position(x: 104, y: 12)
                            .kerning(-10)
                            .clipped()
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    }
                    .frame(width: 295, height: 97, alignment: .bottomTrailing)
                    //                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                }
                //                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                .position(x: 252.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color("ddayOrange"))
                
                
                ZStack(alignment: .bottom) {
                    Text("길게눌러서 디데이 추가하기") // 26
//                            Text("호주여행 준비 시작하는 단계 에 그때에어떻게 준비해야") // 21
//                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 26.0))
                        .frame(width: 330, height: 120, alignment: .topTrailing)
                        .position(x: 230, y: 104)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("ddayChristmasRed"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 40, height: 50, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .position(x: 380, y: 176)
                        .foregroundColor(Color("ddayChristmasRed"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    ZStack {
                        Text("-23")
                            .font(.custom("Inter-ExtraBold", size: 120.0))
                            .frame(width: 380, height: 49, alignment: .topLeading)
                            .position(x: 174, y: 12)
                            .kerning(-10)
                            .clipped()
                            .foregroundColor(Color("ddayChristmasGreen"))
                        //                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    }
                    .frame(width: 295, height: 97, alignment: .bottomLeading)
                    // .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    .background(Color("ddayChristmasRed"))
                }
                .position(x: 147.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color("ddayChristmasGreen"))
                //                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
            }

            
            HStack(alignment: .top, spacing: 0) {
                ZStack(alignment: .top) {
                    Text("길게눌러서 디데이 추가하기") // 26
//                            Text("호주여행 준비 시작하는 단계 에 그때에어떻게 준비해야") // 21
//                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 26.0))
                        .frame(width: 330, height: 120, alignment: .bottomLeading)
                        .position(x: 168, y: 100)
                        .foregroundColor(Color("ddayBabyPurpleBrighter"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 40, height: 50, alignment: .topLeading)
                        .position(x: 22, y: 46)
                    //                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(Color("ddayBabyPurpleBrighter"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    ZStack {
                        
//                                    Text("+9000")
//                                        .font(.custom("Inter-ExtraBold", size: 105.0))
//                                        .frame(width: 380, height: 49, alignment: .topLeading)
//                                        .position(x: 174, y: 21)
                        Text("+12")
                            .font(.custom("Inter-ExtraBold", size: 120.0))
                            .frame(width: 380, height: 49, alignment: .topLeading)
                            .position(x: 174, y: 12)
                            .kerning(-10)
                            .clipped()
                            .foregroundColor(Color("ddayLightOrange"))
                    }
                    .frame(width: 295, height: 97, alignment: .bottomLeading)
                    //                        .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    .background(Color("ddayBabyPurpleBrighter"))
                }
                //                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                .position(x: 252.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color("ddayLightOrange"))
                
                
                ZStack(alignment: .top) {
                    Text("길게눌러서 디데이 추가하기") // 26
//                            Text("호주여행 준비 시작하는 단계 에 그때에어떻게 준비해야") // 21
//                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 26.0))
                        .frame(width: 330, height: 120, alignment: .bottomTrailing)
                        .position(x: 230, y: 100)
                        .foregroundColor(Color("ddayDriedRosePink"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 40, height: 50, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .position(x: 380, y: 46)
                        .foregroundColor(Color("ddayDriedRosePink"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    ZStack {
//                                    Text("+9000")
//                                        .font(.custom("Inter-ExtraBold", size: 105.0))
//                                        .frame(width: 380, height: 49, alignment: .topLeading)
//                                        .position(x: 174, y: 21)
                        Text("+31")
                            .font(.custom("Inter-ExtraBold", size: 120.0))
                            .frame(width: 380, height: 49, alignment: .topTrailing)
                            .position(x: 104, y: 12)
                            .kerning(-10)
                            .clipped()
                            .foregroundColor(Color("ddayPurpleDarker"))
                    }
                    .frame(width: 295, height: 97, alignment: .bottomTrailing)
                    //                        .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    .background(Color("ddayDriedRosePink"))
                }
                //                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                .position(x: 147.5, y: 100)
                .frame(width: 400, height: 200)
                .background(Color("ddayPurpleDarker"))
            }
        }
    }
}
