//
//  WidigetView_Multi01_M_Comp02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

struct WidgetView_Multi01_M_Comp02: View { // enable shadow
    
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
                    Text("호주여행 준비")
//                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0))
                        .frame(width: 200, height: 50, alignment: .topLeading)
                        .position(x: 116, y: 85)
                        .foregroundColor(Color("ddayNeonYellow"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 28, height: 50, alignment: .topLeading)
                        .position(x: 30, y: 123)
                        .foregroundColor(Color("ddayNeonYellow"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    ZStack {
                        Text("-93")
                            .font(.custom("Inter-ExtraBold", size: 56.0))
                            .frame(width: 128, height: 49, alignment: .topTrailing)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .position(x: 65, y: 21)
                            .kerning(-5)
                            .clipped()
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    }
                    .frame(width: 130, height: 49, alignment: .bottomTrailing)
                    //                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                }
                //                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                .position(x: 168, y: 65)
                .frame(width: 230, height: 130)
                .background(Color("ddayOrange"))
                
                
                ZStack(alignment: .bottom) {
                    Text("나니아연대기 책 다 읽기")
//                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0))
                        .frame(width: 200, height: 50, alignment: .topTrailing)
                        .position(x: 110, y: 85)
                        .foregroundColor(Color("ddayChristmasRed"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 28, height: 50, alignment: .topTrailing)
                        .position(x: 198, y: 123)
                        .foregroundColor(Color("ddayChristmasRed"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    ZStack {
                        Text("-143")
                            .font(.custom("Inter-ExtraBold", size: 56.0))
                            .frame(width: 135, height: 49, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .position(x: 64, y: 21)
                            .kerning(-5)
                            .clipped()
                            .foregroundColor(Color("ddayChristmasGreen"))
                        //                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    }
                    .frame(width: 130, height: 49, alignment: .bottomLeading)
                    // .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    .background(Color("ddayChristmasRed"))
                }
                .position(x: 65, y: 65)
                .frame(width: 230, height: 130)
                .background(Color("ddayChristmasGreen"))
                //                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
            }
            
            
            
            HStack(alignment: .top, spacing: 0) {
                
                ZStack(alignment: .top) {
                    Text("여름대비 운동")
//                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0))
                        .frame(width: 200, height: 50, alignment: .topLeading)
                        .position(x: 116, y: 80)                            .foregroundColor(Color("ddayBabyPurpleBrighter"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 28, height: 50, alignment: .topLeading)
                        .position(x: 30, y: 35)
                    //                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(Color("ddayBabyPurpleBrighter"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    ZStack {
                        Text("+12")
                            .font(.custom("Inter-ExtraBold", size: 56.0))
                            .frame(width: 135, height: 49, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .position(x: 61, y: 21)
                            .kerning(-5)
                            .clipped()
                            .foregroundColor(Color("ddayLightOrange"))
                    }
                    .frame(width: 130, height: 49, alignment: .bottomLeading)
                    //                        .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    .background(Color("ddayBabyPurpleBrighter"))
                }
                //                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                .position(x: 168, y: 65)
                .frame(width: 230, height: 130)
                .background(Color("ddayLightOrange"))
                
                
                ZStack(alignment: .top) {
                    Text("물 한잔으로 하루 시작하기")
//                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 14.0))
                        .frame(width: 200, height: 50, alignment: .topTrailing)
                        .position(x: 110, y: 80)
                        .foregroundColor(Color("ddayDriedRosePink"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2023.12.28")
                        .font(.custom("Inter-Bold", size: 9.0))
                        .multilineTextAlignment(.leading)
                        .frame(width: 28, height: 50, alignment: .topTrailing)
                        .position(x: 200, y: 35)
                        .foregroundColor(Color("ddayDriedRosePink"))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayOrange"))
                    
                    ZStack {
                        Text("+31")
                            .font(.custom("Inter-ExtraBold", size: 56.0))
                            .frame(width: 135, height: 49, alignment: .topTrailing)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .position(x: 60, y: 23)
                            .kerning(-5)
                            .clipped()
                            .foregroundColor(Color("ddayPurpleDarker"))
                    }
                    .frame(width: 130, height: 49, alignment: .bottomTrailing)
                    //                        .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    .background(Color("ddayDriedRosePink"))
                }
                //                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                .position(x: 65, y: 65)
                .frame(width: 230, height: 130)
                .background(Color("ddayPurpleDarker"))
                
            }
        }
    }
}
