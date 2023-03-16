//
//  WidigetView_Multi02_M_Comp02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

struct WidgetView_Multi02_M_Comp02: View { // enable shadow
    
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
            Group {
                
                // top stack 4
                Text(ddaySymbolMenu[safe: 3]?.subtitleString ?? "2019.02.28")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 180, y: -42)
                    .rotationEffect(.degrees(-90))
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayNeonEmerald"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonPurple"))
                        .frame(width: 110, height: 90)
                    
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 50.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 44, y: 19)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                    
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayNeonEmerald"))
                    
                    Text(ddaySymbolMenu[safe: 3]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 8.0))
                        .frame(width: 85, height: 50, alignment: .topTrailing)
                        .position(x: 50, y: 45)
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayNeonEmerald"))
                    
                    
                    Text("999")
                        .font(.custom("Inter-Bold", size: 57.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 73, y: 60)
                        .rotationEffect(.degrees(-6))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayNeonEmerald"))
                    
                }
                .frame(width: 110, height: 90)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 68, y: 134)
                
                
                // top stack 5
                Text(ddaySymbolMenu[safe: 4]?.subtitleString ?? "2021.02.28")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 181, y: 194)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayWhite"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("ddayNeonPink"))
                        .frame(width: 115, height: 67)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 44.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 46, y: 8)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayWhite"))
                    
                    Text(ddaySymbolMenu[safe: 4]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 8.0))
                        .frame(width: 85, height: 50, alignment: .topTrailing)
                        .position(x: 55, y: 30)
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayWhite"))
                    
                    Text("999")
                        .font(.custom("Inter-Bold", size: 47.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 75, y: 47)
                        .rotationEffect(.degrees(-6))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayWhite"))
                    
                    
                }
                .frame(width: 115, height: 67)
                .cornerRadius(20)
                .background(.clear)
                .position(x: 170, y: 134)
                
                
                
                // top stack 1
                Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2022.02.28")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 74, y: 50)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayNeonGreen"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonGreen"))
                        .frame(width: 150, height: 70)
                    
                    Text("D")
                        .font(.custom("Inter-ExtraBold", size: 50.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 48, y: 4)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayBlack"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 9.0))
                        .frame(width: 90, height: 50, alignment: .topTrailing)
                        .position(x: 65, y: 32)
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayBlack"))
                    
                    Text("999")
                        .font(.custom("Inter-Bold", size: 51.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 78, y: 50)
                        .rotationEffect(.degrees(-4))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayBlack"))
                }
                .frame(width: 150, height: 70)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 75, y: 70)
            }
            
            
            Group {
                // top stack 6
                Text(ddaySymbolMenu[safe: 5]?.subtitleString ?? "2023.02.28")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 239, y: 194)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayChristmasRed"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonBlueDarker"))
                        .frame(width: 149, height: 81)
                    
                    
                
                    Text("D")
                        .font(.custom("Inter-ExtraBold", size: 50.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 48, y: 10)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayChristmasRed"))
                    
                    Text("03")
                        .font(.custom("Inter-Bold", size: 53.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 71, y: 54)
                        .rotationEffect(.degrees(-6))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayChristmasRed"))
                    
                    Text(ddaySymbolMenu[safe: 5]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 9.0))
                        .frame(width: 97, height: 50, alignment: .topTrailing)
                        .position(x: 60, y: 38)
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayChristmasRed"))
                    
                    
                }
                .frame(width: 149, height: 81)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 296, y: 141)
                
                
                
                // top stack 3
                Text(ddaySymbolMenu[safe: 2]?.subtitleString ?? "2019.12.28")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 162, y: -41)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayYellow"))
                    .rotationEffect(.degrees(90))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonSkyBlue"))
                        .frame(width: 119, height: 85)
                    
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 54.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 64, y: 8)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayYellow"))
                    
                    Text(ddaySymbolMenu[safe: 2]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 8.0))
                        .frame(width: 85, height: 70, alignment: .topTrailing)
                        .position(x: 68, y: 46)
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayYellow"))
                    
                    
                    Text("111")
                        .font(.custom("Inter-Bold", size: 59.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 91, y: 55)
                        .rotationEffect(.degrees(-6))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayYellow"))
                    
                    
                }
                .frame(width: 119, height: 85)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 266, y: 67)
                
                
                
                // top stack 2
                Text(ddaySymbolMenu[safe: 1]?.subtitleString ?? "2022.12.28")
                    .font(.custom("Inter-Bold", size: 8.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 132, y: 50)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayOrangeLighter"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonCrimson"))
                        .frame(width: 119, height: 81)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 57.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 48, y: 5)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayOrangeLighter"))
                    
                    Text(ddaySymbolMenu[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 9.0))
                        .frame(width: 97, height: 50, alignment: .topTrailing)
                        .position(x: 60, y: 35)
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayOrangeLighter"))
                    
                    Text("999")
                        .font(.custom("Inter-Bold", size: 58.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 73, y: 52)
                        .rotationEffect(.degrees(-6))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayOrangeLighter"))
                     
                }
                .frame(width: 119, height: 81)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 172, y: 61)
            }
        }
        .frame(height: 200)
        .background(Color("ddayBlack"))
        
    }
}
