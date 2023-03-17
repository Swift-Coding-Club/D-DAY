//
//  WidgetView_Multi08_XL_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/16.
//

import SwiftUI

struct WidgetView_Multi08_XL_Comp01: View { // disable shadow
    
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
                 // top stack 5
                Text(ddaySymbolMenu[safe: 4]?.subtitleString ?? "2022.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 325, y: -108)
                    .rotationEffect(.degrees(-90))
                 //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                 .foregroundColor(Color("ddayNeonEmerald"))
                 
                 ZStack{
                 RoundedRectangle(cornerRadius: 25)
                 .fill(Color("ddayNeonPurple"))
                 .frame(width: 172, height: 176)
                 
                 Text("D")
                 .font(.custom("Inter-Bold", size: 105.0))
                 .frame(width: 80, height: 50, alignment: .topLeading)
                 .position(x: 44, y: 3)
                 .rotationEffect(.degrees(-12))
                 .multilineTextAlignment(.trailing)
                 //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                 .foregroundColor(Color("ddayNeonEmerald"))
                 
                 Text(ddaySymbolMenu[safe: 9]?.displayString ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-ExtraBold", size: 13.0))
                         .frame(width: 90, height: 50, alignment: .topTrailing)
                         .position(x: 116, y: 47)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                 //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                 .foregroundColor(Color("ddayNeonEmerald"))
                 
                 Text("03")
                 .font(.custom("Inter-Bold", size: 107.0))
                 .frame(width: 400, height: 60, alignment: .topLeading)
                 .kerning(-10)
                 .position(x: 183, y: 93)
                 .rotationEffect(.degrees(-10))
                 //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                 .foregroundColor(Color("ddayNeonEmerald"))
                 }
                 .frame(width: 172, height: 176)
                 .cornerRadius(25)
                 .background(.clear)
                 .position(x: 100, y: 308)
                 
                
                
                 
                 // top stack 6
                Text(ddaySymbolMenu[safe: 5]?.subtitleString ?? "2022.02.28")
                     .font(.custom("Inter-Bold", size: 12.0))
                     .frame(width: 120, height: 50, alignment: .topLeading)
                     .position(x: 250, y: 404)
                     //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                     .foregroundColor(Color("ddayNeonYellow"))
                 
                 ZStack{
                     RoundedRectangle(cornerRadius: 25)
                         .fill(Color("ddayNeonPink"))
                         .frame(width: 195, height: 168)
                     
                     Text("D")
                         .font(.custom("Inter-Bold", size: 105.0))
                         .frame(width: 80, height: 50, alignment: .topLeading)
                         .position(x: 40, y: 1)
                         .rotationEffect(.degrees(-12))
                         .multilineTextAlignment(.trailing)
                         //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                         .foregroundColor(Color("ddayNeonYellow"))
                     
                     Text(ddaySymbolMenu[safe: 5]?.displayString ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-ExtraBold", size: 13.0))
                         .frame(width: 90, height: 50, alignment: .topTrailing)
                         .position(x: 120, y: 53)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                         .foregroundColor(Color("ddayNeonYellow"))
                 
                     Text("152")
                         .font(.custom("Inter-Bold", size: 110.0))
                         .frame(width: 400, height: 60, alignment: .topLeading)
                         .kerning(-10)
                         .position(x: 185, y: 87)
                         .rotationEffect(.degrees(-10))
                         //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                         .foregroundColor(Color("ddayNeonYellow"))
                 }
                 .frame(width: 195, height: 168)
                 .cornerRadius(25)
                 .background(.clear)
                 .position(x: 275, y: 294)
                
                
                
                
                // top stack 7
               Text(ddaySymbolMenu[safe: 6]?.subtitleString ?? "2022.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 346, y: 404)
                    //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayNeonGreanBrighter"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonOrange"))
                        .frame(width: 185, height: 186)
                
                    Text("D")
                        .font(.custom("Inter-Bold", size: 111.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 42, y: 13)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayNeonGreanBrighter"))
                
                    Text(ddaySymbolMenu[safe: 6]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 90, height: 50, alignment: .topTrailing)
                        .position(x: 115, y: 64)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayNeonGreanBrighter"))
                
                    Text("766")
                        .font(.custom("Inter-Bold", size: 110.0)) // 900 - 110, 2자리-130(111)
                        .frame(width: 400, height: 60, alignment: .topLeading)
                        .kerning(-10)
//                                .position(x: 186, y: 95)
                        .position(x: 186, y: 105) // 3자리
                        .rotationEffect(.degrees(-10))
                        //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayNeonGreanBrighter"))
                }
                .frame(width: 185, height: 186)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 447, y: 303)
                
                
                
                // top stack 8
                Text(ddaySymbolMenu[safe: 7]?.subtitleString ?? "2022.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 430, y: -107)
                    .rotationEffect(.degrees(90))
                     //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayWhite"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayHotpink"))
                        .frame(width: 175, height: 196)
                
                    Text("D")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 43, y: 18)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayWhite"))
                
                    Text(ddaySymbolMenu[safe: 7]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 90, height: 70, alignment: .topTrailing)
                        .position(x: 116, y: 77)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayWhite"))
                    
                    Text("113")
                        .font(.custom("Inter-Bold", size: 108.0))
                        .frame(width: 400, height: 60, alignment: .topLeading)
                        .kerning(-10)
                        .position(x: 185, y: 110)
                        .rotationEffect(.degrees(-10))
                        //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayWhite"))
                }
                .frame(width: 175, height: 196)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 613, y: 298)
            }
            
            
            Group {
                // top stack 4
                Text(ddaySymbolMenu[safe: 3]?.subtitleString ?? "2022.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 505, y: 86)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayChristmasRed"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonBlueDarker"))
                        .frame(width: 200, height: 165)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 50, y: -10)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayChristmasRed"))
                    
                    Text(ddaySymbolMenu[safe: 9]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 93, height: 50, alignment: .topTrailing)
                        .position(x: 133, y: 40)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayChristmasRed"))
                    
                    Text("755")
                        .font(.custom("Inter-Bold", size: 121.0))
                        .frame(width: 400, height: 60, alignment: .topLeading)
                        .kerning(-10)
                        .position(x: 187, y: 74)
                        .rotationEffect(.degrees(-10))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayChristmasRed"))
                }
                .frame(width: 200, height: 165)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 619, y: 136)
                
                
                // top stack 3
                Text(ddaySymbolMenu[safe: 2]?.subtitleString ?? "2022.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 410, y: 86)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayYellow"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonSkyBlue"))
                        .frame(width: 196, height: 155)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 105.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 53, y: -10)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayYellow"))
                    
                    Text(ddaySymbolMenu[safe: 9]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 93, height: 50, alignment: .topTrailing)
                        .position(x: 133, y: 42)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayYellow"))
                    
                    Text("316")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 400, height: 60, alignment: .topLeading)
                        .kerning(-10)
                        .position(x: 200, y: 73)
                        .rotationEffect(.degrees(-10))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayYellow"))
                }
                .frame(width: 196, height: 155)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 425, y: 158)
                
                
                
                // top stack 2
                Text(ddaySymbolMenu[safe: 1]?.subtitleString ?? "2023.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 160, y: 86)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayOrangeLighter"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonCrimson"))
                        .frame(width: 170, height: 170)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 115.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 55, y: -12)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayOrangeLighter"))
                    
                    Text(ddaySymbolMenu[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 80, height: 50, alignment: .topTrailing)
                        .position(x: 110, y: 42)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayOrangeLighter"))
                    
                    Text("51")
                        .font(.custom("Inter-Bold", size: 115.0)) // 3자리-106, 2자리-
                        .frame(width: 300, height: 60, alignment: .topLeading)
                        .kerning(-10)
//                        .position(x: 147, y: 88) // 3자리
                        .position(x: 147, y: 84) // 2자리
                        .rotationEffect(.degrees(-10))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayOrangeLighter"))
                        .clipped()
                }
                .frame(width: 170, height: 170)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 260, y: 139)
                
                
                
                
                // top stack 1
                Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2021.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 74, y: 86)
                //                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    .foregroundColor(Color("ddayNeonGreen"))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("ddayNeonGreen"))
                        .frame(width: 190, height: 152)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 103.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 46, y: -12)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayBlack"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 13.0))
                        .frame(width: 95, height: 50, alignment: .topTrailing)
                        .position(x: 125, y: 40)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayBlack"))
                    
                    Text("124")
                        .font(.custom("Inter-Bold", size: 111.0))
                        .frame(width: 250, height: 60, alignment: .topLeading)
                        .kerning(-10)
                        .position(x: 115, y: 69)
                        .rotationEffect(.degrees(-10))
                    //                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        .foregroundColor(Color("ddayBlack"))
                        .clipped()
                }
                .frame(width: 190, height: 152)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 95, y: 154)
                
            }
        }
        .frame(height: 450)
        .background(Color("ddayBlack"))
    }
}
