//
//  WidgetView_Multi08_XL_Comp01_1.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/24.
//

import SwiftUI

struct WidgetView_Multi08_XL_Comp01_1: View { // disable shadow
    
    var entry: Provider.Entry
    
    var ddaySymbolMenu: [DdaySymbol]
    
    var body: some View {
        
        Group {
            
             // top stack 5
            Text(ddaySymbolMenu[safe: 4]?.ddayDate ?? "2022.02.28")
                .font(.custom("Inter-Bold", size: 12.0))
                .frame(width: 120, height: 50, alignment: .topLeading)
                .position(x: 325, y: -108)
                .rotationEffect(.degrees(-90))
                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))
             
             ZStack{
                 RoundedRectangle(cornerRadius: 25)
                         .fill(Color(hex: ddaySymbolMenu[safe: 4]?.ddayBgColor ?? "ddayNeonPurple"))
                         .frame(width: 172, height: 176)
                 
                 // D or + 5
                 switch CustomFunctions().ddaySetDorPlus(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 4]?.ddayDate ??  "2023.12.16"), isTodayCounted: ddaySymbolMenu[safe: 4]?.ddayIsCountdown ?? "false")) {
                 case "D":
                     Text("D")
                         .font(.custom("Inter-Bold", size: 105.0))
                         .frame(width: 80, height: 50, alignment: .topLeading)
                         .position(x: 44, y: 3)
                         .rotationEffect(.degrees(-12))
                         .multilineTextAlignment(.trailing)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))
                         .clipped()
                     
                 case "+":
                     Text("+")
                         .font(.custom("Inter-Bold", size: 150.0))
                         .frame(width: 100, height: 50, alignment: .topLeading)
                         .position(x: 50, y: -34)
                         .rotationEffect(.degrees(-12))
                         .multilineTextAlignment(.trailing)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))
                         .clipped()
                     
                 default:
                         Text("Error #DorP M08-1-5")
                 }
                 
                 
                 // Title 5
                 switch (ddaySymbolMenu[safe: 4]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                 case ...5:
                     Text(ddaySymbolMenu[safe: 4]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 22.0))
                         .frame(width: 84, height: 80, alignment: .topTrailing)
                         .position(x: 116, y: 64)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))
                     
                 case 6...10:
                     Text(ddaySymbolMenu[safe: 4]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 20.0))
                         .frame(width: 80, height: 80, alignment: .topTrailing)
                         .position(x: 113, y: 64)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))

                 case 11...15:
                     Text(ddaySymbolMenu[safe: 4]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 17.0))
                         .frame(width: 85, height: 80, alignment: .topTrailing)
                         .position(x: 113, y: 61)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))
                     
                 case 16...:
                     Text(ddaySymbolMenu[safe: 4]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 13.0))
                         .frame(width: 90, height: 50, alignment: .topTrailing)
                         .position(x: 116, y: 47)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))
                     
                 default:
                     Text("Error #F-Size M08-1-5")
                 }
                 
                 
                 // DayNumber 5
                 switch CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 4]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 4]?.ddayIsCountdown ?? "false")).count {
                     
                 case ...3:
                     Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 4]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 4]?.ddayIsCountdown ?? "false")))")
                             .font(.custom("Inter-Bold", size: 107.0))
                             .frame(width: 400, height: 60, alignment: .topLeading)
                             .kerning(-10)
                             .position(x: 183, y: 93)
                             .rotationEffect(.degrees(-10))
                             .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))
                             .clipped()
                     
                 case 4...:
                     Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 4]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 4]?.ddayIsCountdown ?? "false")))")
                             .font(.custom("Inter-Bold", size: 83.0))
                             .frame(width: 400, height: 60, alignment: .topLeading)
                             .kerning(-10)
                             .position(x: 183, y: 113)
                             .rotationEffect(.degrees(-10))
                             .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayNeonEmerald"))
                             .clipped()
                     
                 default:
                     Text("Error #F-Count M08-1-5")
                 }
                 
             }
             .frame(width: 172, height: 176)
             .cornerRadius(25)
             .background(.clear)
             .position(x: 100, y: 308)
             
            
            
            
            
            
             // top stack 6
            Text(ddaySymbolMenu[safe: 5]?.ddayDate ?? "2022.02.28")
                 .font(.custom("Inter-Bold", size: 12.0))
                 .frame(width: 120, height: 50, alignment: .topLeading)
                 .position(x: 250, y: 404)
                 .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
             
             ZStack{
                 RoundedRectangle(cornerRadius: 25)
                     .fill(Color(hex: ddaySymbolMenu[safe: 5]?.ddayBgColor ?? "ddayNeonPink"))
                     .frame(width: 195, height: 168)
                 
                 
                 // D or + 6
                 switch CustomFunctions().ddaySetDorPlus(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 5]?.ddayDate ??  "2023.12.16"), isTodayCounted: ddaySymbolMenu[safe: 5]?.ddayIsCountdown ?? "false")) {
                 case "D":
                     Text("D")
                         .font(.custom("Inter-Bold", size: 105.0))
                         .frame(width: 80, height: 50, alignment: .topLeading)
                         .position(x: 40, y: 1)
                         .rotationEffect(.degrees(-12))
                         .multilineTextAlignment(.trailing)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
                         .clipped()
                     
                 case "+":
                     Text("+")
                         .font(.custom("Inter-Bold", size: 150.0))
                         .frame(width: 100, height: 50, alignment: .topLeading)
                         .position(x: 47, y: -40)
                         .rotationEffect(.degrees(-12))
                         .multilineTextAlignment(.trailing)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
                         .clipped()
                     
                 default:
                         Text("Error #DorP M08-1-6")
                 }
                 
                 
                 // Title 6
                 switch (ddaySymbolMenu[safe: 5]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                 case ...4:
                     Text(ddaySymbolMenu[safe: 5]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 22.0))
                         .frame(width: 90, height: 80, alignment: .topTrailing)
                         .position(x: 115, y: 73)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
                     
                 case 5:
                     Text(ddaySymbolMenu[safe: 5]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 21.0))
                         .frame(width: 90, height: 80, alignment: .topTrailing)
                         .position(x: 110, y: 67)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
                     
                 case 6...10:
                     Text(ddaySymbolMenu[safe: 5]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 19.0))
                         .frame(width: 90, height: 50, alignment: .topTrailing)
                         .position(x: 115, y: 53)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))

                 case 11...15:
                     Text(ddaySymbolMenu[safe: 5]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 16.0))
                         .frame(width: 105, height: 80, alignment: .topTrailing)
                         .position(x: 110, y: 73)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
                     
                 case 16...:
                     Text(ddaySymbolMenu[safe: 5]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                         .font(.custom("Inter-Bold", size: 13.0))
                         .frame(width: 90, height: 50, alignment: .topTrailing)
                         .position(x: 120, y: 53)
                         .multilineTextAlignment(.trailing)
                         .lineLimit(3)
                         .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
                     
                 default:
                     Text("Error #F-Size M08-1-6")
                 }
                 
                 
                 // DayNumber 6
                 switch CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 5]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 5]?.ddayIsCountdown ?? "false")).count {
                     
                 case ...3:
                     Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 5]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 5]?.ddayIsCountdown ?? "false")))")
                             .font(.custom("Inter-Bold", size: 110.0))
                             .frame(width: 400, height: 60, alignment: .topLeading)
                             .kerning(-10)
                             .position(x: 185, y: 87)
                             .rotationEffect(.degrees(-10))
                             .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
                             .clipped()
                     
                 case 4...:
                     Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 5]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 5]?.ddayIsCountdown ?? "false")))")
                             .font(.custom("Inter-Bold", size: 86.0))
                             .frame(width: 400, height: 60, alignment: .topLeading)
                             .kerning(-10)
                             .position(x: 185, y: 100)
                             .rotationEffect(.degrees(-10))
                             .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayNeonYellow"))
                             .clipped()
                     
                 default:
                     Text("Error #F-Count M08-1-6")
                 }
                 
             }
             .frame(width: 195, height: 168)
             .cornerRadius(25)
             .background(.clear)
             .position(x: 275, y: 294)
    
            
            
            
            
            
            // top stack 7
           Text(ddaySymbolMenu[safe: 6]?.ddayDate ?? "2022.02.28")
                .font(.custom("Inter-Bold", size: 12.0))
                .frame(width: 120, height: 50, alignment: .topLeading)
                .position(x: 346, y: 404)
                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(hex: ddaySymbolMenu[safe: 6]?.ddayBgColor ?? "ddayNeonOrange"))
                    .frame(width: 185, height: 186)
                
                
                // D or + 7
                switch CustomFunctions().ddaySetDorPlus(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 6]?.ddayDate ??  "2023.12.16"), isTodayCounted: ddaySymbolMenu[safe: 6]?.ddayIsCountdown ?? "false")) {
                case "D":
                    Text("D")
                        .font(.custom("Inter-Bold", size: 111.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 42, y: 13)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
                        .clipped()
                    
                case "+":
                    Text("+")
                        .font(.custom("Inter-Bold", size: 156.0))
                        .frame(width: 100, height: 50, alignment: .topLeading)
                        .position(x: 48, y: -30)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
                        .clipped()
                    
                default:
                        Text("Error #DorP M08-1-7")
                }
                
            
                // Title 7
                switch (ddaySymbolMenu[safe: 6]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                case ...4:
                    Text(ddaySymbolMenu[safe: 6]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 22.0))
                        .frame(width: 90, height: 50, alignment: .topTrailing)
                        .position(x: 113, y: 70)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
                    
                case 5:
                    Text(ddaySymbolMenu[safe: 6]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 23.0))
                        .frame(width: 90, height: 80, alignment: .topTrailing)
                        .position(x: 115, y: 79)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
                    
                case 6...10:
                    Text(ddaySymbolMenu[safe: 6]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 19.0))
                        .frame(width: 90, height: 50, alignment: .topTrailing)
                        .position(x: 115, y: 64)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))

                case 11...15:
                    Text(ddaySymbolMenu[safe: 6]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 16.0))
                        .frame(width: 100, height: 80, alignment: .topTrailing)
                        .position(x: 110, y: 76)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
                    
                case 16...:
                    Text(ddaySymbolMenu[safe: 6]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0))
                        .frame(width: 90, height: 50, alignment: .topTrailing)
                        .position(x: 115, y: 64)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
                    
                default:
                    Text("Error #F-Size M08-1-7")
                }
                
                
                // DayNumber 7
                switch CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 6]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 6]?.ddayIsCountdown ?? "false")).count {
                    
                case ...3:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 6]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 6]?.ddayIsCountdown ?? "false")))")
                            .font(.custom("Inter-Bold", size: 110.0))
                            .frame(width: 400, height: 60, alignment: .topLeading)
                            .kerning(-10)
                            .position(x: 186, y: 105)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
                            .clipped()
                    
                case 4...:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 6]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 6]?.ddayIsCountdown ?? "false")))")
                            .font(.custom("Inter-Bold", size: 85.0))
                            .frame(width: 400, height: 60, alignment: .topLeading)
                            .kerning(-10)
                            .position(x: 184, y: 120)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 6]?.ddayTxtColor ?? "ddayNeonGreanBrighter"))
                            .clipped()
                    
                default:
                    Text("Error #F-Count M08-1-7")
                }
                
            }
            .frame(width: 185, height: 186)
            .cornerRadius(25)
            .background(.clear)
            .position(x: 447, y: 303)
            
            
            
            
            
            
            
            
            // top stack 8
            Text(ddaySymbolMenu[safe: 7]?.ddayDate ?? "2022.02.28")
                .font(.custom("Inter-Bold", size: 12.0))
                .frame(width: 120, height: 50, alignment: .topLeading)
                .position(x: 430, y: -107)
                .rotationEffect(.degrees(90))
                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayWhite"))
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(hex: ddaySymbolMenu[safe: 7]?.ddayBgColor ?? "ddayHotpink"))
                    .frame(width: 175, height: 196)
                
                
                
                
                // D or + 8
                switch CustomFunctions().ddaySetDorPlus(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 7]?.ddayDate ??  "2023.12.16"), isTodayCounted: ddaySymbolMenu[safe: 7]?.ddayIsCountdown ?? "false")) {
                case "D":
                    Text("D")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 43, y: 18)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayNeonYellow"))
                        .clipped()
                    
                case "+":
                    Text("+")
                        .font(.custom("Inter-Bold", size: 152.0))
                        .frame(width: 100, height: 50, alignment: .topLeading)
                        .position(x: 50, y: -20)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayNeonYellow"))
                        .clipped()
                    
                default:
                        Text("Error #DorP M08-1-8")
                }
                
                
                // Title 8
                switch (ddaySymbolMenu[safe: 7]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                case ...4:
                    Text(ddaySymbolMenu[safe: 7]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 22.0))
                        .frame(width: 90, height: 70, alignment: .topTrailing)
                        .position(x: 116, y: 77)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayNeonYellow"))
                    
                case 5...10:
                    Text(ddaySymbolMenu[safe: 7]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 21.0))
                        .frame(width: 90, height: 70, alignment: .topTrailing)
                        .position(x: 116, y: 77)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayNeonYellow"))

                case 11...15:
                    Text(ddaySymbolMenu[safe: 7]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 18.0))
                        .frame(width: 90, height: 80, alignment: .topTrailing)
                        .position(x: 116, y: 74)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayNeonYellow"))
                    
                case 16...:
                    Text(ddaySymbolMenu[safe: 7]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 17.0))
                        .frame(width: 90, height: 100, alignment: .topTrailing)
                        .position(x: 119, y: 85)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(6)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayNeonYellow"))
                    
                default:
                    Text("Error #F-Size M08-1-8")
                }
                
                
                // DayNumber 8
                switch CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 7]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 7]?.ddayIsCountdown ?? "false")).count {
                    
                case ...3:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 7]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 7]?.ddayIsCountdown ?? "false")))")
                            .font(.custom("Inter-Bold", size: 108.0))
                            .frame(width: 400, height: 60, alignment: .topLeading)
                            .kerning(-10)
                            .position(x: 185, y: 110)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayNeonYellow"))
                            .clipped()
                    
                case 4...:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 7]?.ddayDate ??  "2023.10.16"), isTodayCounted: ddaySymbolMenu[safe: 7]?.ddayIsCountdown ?? "false")))")
                            .font(.custom("Inter-Bold", size: 86.0))
                            .frame(width: 400, height: 60, alignment: .topLeading)
                            .kerning(-10)
                            .position(x: 185, y: 125)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 7]?.ddayTxtColor ?? "ddayNeonYellow"))
                            .clipped()
                    
                default:
                    Text("Error #F-Count M08-1-8")
                }
            }
            .frame(width: 175, height: 196)
            .cornerRadius(25)
            .background(.clear)
            .position(x: 613, y: 298)
             
        }
    }
}
