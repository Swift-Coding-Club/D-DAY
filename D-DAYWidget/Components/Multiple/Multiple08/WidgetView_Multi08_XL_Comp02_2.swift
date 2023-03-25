//
//  WidgetView_Multi08_XL_Comp02_2.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/24.
//

import SwiftUI

struct WidgetView_Multi08_XL_Comp02_2: View { // enable shadow
    
    var entry: Provider.Entry
    
    var ddaySymbolMenu: [DdaySymbol]
    
    var body: some View {
        
        Group {
            
            // top stack 4
            Text(ddaySymbolMenu[safe: 3]?.ddayDate ?? "2022.02.28")
                .font(.custom("Inter-Bold", size: 12.0))
                .frame(width: 120, height: 50, alignment: .topLeading)
                .position(x: 505, y: 86)
                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(hex: ddaySymbolMenu[safe: 3]?.ddayBgColor ?? "ddayNeonBlueDarker"))
                    .frame(width: 200, height: 165)
                
                // D or + 4
                switch CustomFunctions().ddaySetDorPlus(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.12.16"))) {
                case "D":
                    Text("D")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 49, y: -10)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
                        .clipped()
                    
                case "+":
                    Text("+")
                        .font(.custom("Inter-Bold", size: 150.0))
                        .frame(width: 100, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 47, y: -46)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
                        .clipped()
                    
                default:
                        Text("Error #DorP M08-1-4")
                }
                
                
                // Title 4
                switch (ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                case ...4:
                    Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 25.0))
                        .frame(width: 93, height: 50, alignment: .topTrailing)
                        .position(x: 131, y: 45)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
                    
                case 5:
                    Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 23.0))
                        .frame(width: 100, height: 100, alignment: .topTrailing)
                        .position(x: 133, y: 70)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
                    
                case 6...10:
                    Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 20.0))
                        .frame(width: 100, height: 100, alignment: .topTrailing)
                        .position(x: 127, y: 65)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))

                case 11...15:
                    Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 17.0))
                        .frame(width: 110, height: 100, alignment: .topTrailing)
                        .position(x: 130, y: 65)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
                    
                case 16...:
                    Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 17.0))
                        .frame(width: 93, height: 50, alignment: .topTrailing)
                        .position(x: 133, y: 40)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
                    
                default:
                    Text("Error #F-Size M08-1-4")
                }
            
                
                // DayNumber 4
                switch CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"))).count {
                    
                case ...3:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"))))")
                            .font(.custom("Inter-Bold", size: 121.0))
                            .frame(width: 400, height: 60, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .kerning(-10)
                            .position(x: 187, y: 76)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
                            .clipped()
                    
                case 4...:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  "2023.10.16"))))")
                            .font(.custom("Inter-Bold", size: 93.0))
                            .frame(width: 400, height: 60, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .kerning(-10)
                            .position(x: 188, y: 89)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayChristmasRed"))
                            .clipped()
                    
                default:
                    Text("Error #F-Count M08-1-4")
                }
                
            }
            .frame(width: 200, height: 165)
            .cornerRadius(25)
            .background(.clear)
            .position(x: 619, y: 136)
            
            
            
            
            
             
            // top stack 3
            Text(ddaySymbolMenu[safe: 2]?.ddayDate ?? "2022.02.28")
                .font(.custom("Inter-Bold", size: 12.0))
                .frame(width: 120, height: 50, alignment: .topLeading)
                .position(x: 410, y: 86)
                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(hex: ddaySymbolMenu[safe: 2]?.ddayBgColor ?? "ddayNeonSkyBlue"))
                    .frame(width: 196, height: 155)
                
                
                
                // D or + 3
                switch CustomFunctions().ddaySetDorPlus(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.12.16"))) {
                case "D":
                    Text("D")
                        .font(.custom("Inter-Bold", size: 105.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 53, y: -10)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
             .clipped()
                    
                case "+":
                    Text("+")
                        .font(.custom("Inter-Bold", size: 151.0))
                        .frame(width: 100, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 52, y: -46)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
             .clipped()
                    
                default:
                        Text("Error #DorP M08-1-3")
                }
                
                
                // Title 3
                switch (ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                case ...4:
                    Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 23.0))
                        .frame(width: 93, height: 50, alignment: .topTrailing)
                        .position(x: 130, y: 44)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                    
                case 5...6:
                    Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 20.0))
                        .frame(width: 93, height: 50, alignment: .topTrailing)
                        .position(x: 133, y: 45)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                    
                case 7...10:
                    Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 20.0))
                        .frame(width: 93, height: 50, alignment: .topTrailing)
                        .position(x: 133, y: 38)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))

                case 11...15:
                    Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 17.0))
                        .frame(width: 110, height: 80, alignment: .topTrailing)
                        .position(x: 130, y: 55)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                    
                case 16...:
                    Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 15.0))
                        .frame(width: 110, height: 80, alignment: .topTrailing)
                        .position(x: 128, y: 50)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(4)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                    
                default:
                    Text("Error #F-Size M08-1-3")
                }
                
                                        
                // DayNumber 3
                switch CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))).count {
                case ...3:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))))")
                            .font(.custom("Inter-Bold", size: 110.0))
                            .frame(width: 400, height: 60, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .kerning(-10)
                            .position(x: 200, y: 73)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                            .clipped()
                    
                case 4...:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  "2023.10.16"))))")
                            .font(.custom("Inter-Bold", size: 88.0))
                            .frame(width: 400, height: 60, alignment: .topLeading)
                            .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                            .kerning(-10)
                            .position(x: 201, y: 85)
                            .rotationEffect(.degrees(-10))
                            .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                            .clipped()
                    
                default:
                    Text("Error #F-Count M08-1-3")
                }
            }
            .frame(width: 196, height: 155)
            .cornerRadius(25)
            .background(.clear)
            .position(x: 425, y: 158)
            
            
            
            
            
            
            
            // top stack 2
            Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2023.02.28")
                .font(.custom("Inter-Bold", size: 12.0))
                .frame(width: 120, height: 50, alignment: .topLeading)
                .position(x: 160, y: 86)
                .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayNeonCrimson"))
                    .frame(width: 170, height: 170)
                
                
                // D or + 2
                switch CustomFunctions().ddaySetDorPlus(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.12.16"))) {
                case "D":
                    Text("D")
                        .font(.custom("Inter-Bold", size: 115.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 55, y: -12)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                        .clipped()
                    
                case "+":
                    Text("+")
                        .font(.custom("Inter-Bold", size: 153.0))
                        .frame(width: 110, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 53, y: -42)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                        .clipped()
                    
                default:
                        Text("Error #DorP M08-1-2")
                }
                
                
                // Title 2
                switch (ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                case ...4:
                    Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 21.0))
                        .frame(width: 80, height: 50, alignment: .topTrailing)
                        .position(x: 117, y: 46)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                    
                case 5...6:
                    Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 20.0))
                        .frame(width: 80, height: 50, alignment: .topTrailing)
                        .position(x: 114, y: 44)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                    
                case 7...10:
                    Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 18.0))
                        .frame(width: 80, height: 80, alignment: .topTrailing)
                        .position(x: 118, y: 60)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                    
                case 11...15:
                    Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 16.0))
                        .frame(width: 80, height: 80, alignment: .topTrailing)
                        .position(x: 117, y: 52)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                    
                case 16...:
                    Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0))
                        .frame(width: 80, height: 90, alignment: .topTrailing)
                        .position(x: 115, y: 58)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(5)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                    
                default:
                    Text("Error #F-Size M08-1-2")
                }
                
                
                // DayNumber 2
                switch CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))).count {
                    
                case ...2:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))))")
                        .font(.custom("Inter-Bold", size: 115.0))
                        .frame(width: 300, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-10)
                        .position(x: 147, y: 84)
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                        .clipped()
                    
                case 3:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))))")
                        .font(.custom("Inter-Bold", size: 100.0))
                        .frame(width: 300, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-10)
                        .position(x: 146, y: 94)
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                        .clipped()
                    
                case 4...:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  "2023.10.16"))))")
                        .font(.custom("Inter-Bold", size: 80.0))
                        .frame(width: 300, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-10)
                        .position(x: 147, y: 104)
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                        .clipped()
                    
                default:
                    Text("Error #F-Count M08-1-2")
                }
                
            }
            .frame(width: 170, height: 170)
            .cornerRadius(25)
            .background(.clear)
            .position(x: 260, y: 139)
            
            
            
            
            
            
            
            // top stack 1
            
            // Date 1
            switch ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen" {
            case "ddayBlack":
                Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2021.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 74, y: 86)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonGreen"))

            default:
                Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2021.02.28")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 120, height: 50, alignment: .topLeading)
                    .position(x: 74, y: 86)
                    .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
            }
            
            
             
            // Others 1
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonGreen"))
                    .frame(width: 190, height: 152)
                
                
                // D or + 1
                switch CustomFunctions().ddaySetDorPlus(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.12.16"))) {
                case "D":
                    Text("D")
                        .font(.custom("Inter-Bold", size: 103.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 46, y: -12)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                        .clipped()
                    
                case "+":
                    Text("+")
                        .font(.custom("Inter-Bold", size: 150.0))
                        .frame(width: 100, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 48, y: -45)
                        .rotationEffect(.degrees(-12))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                        .clipped()
                    
                default:
                        Text("Error #DorP M08-1-1")
                }
                
                
                // Title 1
                switch (ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기").count {
                case ...4:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 21.0))
                        .frame(width: 95, height: 50, alignment: .topTrailing)
                        .position(x: 120, y: 43)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                    
                case 5...6:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 20.0))
                        .frame(width: 95, height: 50, alignment: .topTrailing)
                        .position(x: 125, y: 45)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                    
                case 7...10:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 18.0))
                        .frame(width: 95, height: 50, alignment: .topTrailing)
                        .position(x: 125, y: 40)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))

                case 11...15:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 16.0))
                        .frame(width: 110, height: 50, alignment: .topTrailing)
                        .position(x: 120, y: 40)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                    
                case 16...:
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0))
                        .frame(width: 110, height: 50, alignment: .topTrailing)
                        .position(x: 125, y: 45)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(3)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                    
                default:
                    Text("Error #F-Size M08-1-1")
                }
                
                
                // DayNumber 1
                switch CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))).count {
                    
                case ...3:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))))")
                        .font(.custom("Inter-Bold", size: 111.0))
                        .frame(width: 250, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-10)
                        .position(x: 115, y: 69)
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                        .clipped()
                    
                case 4...:
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  "2023.10.16"))))")
                        .font(.custom("Inter-Bold", size: 93.0))
                        .frame(width: 250, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-10)
                        .position(x: 110, y: 80)
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                        .clipped()
                    
                default:
                    Text("Error #F-Count M08-1-1")
                }
            }
            .frame(width: 190, height: 152)
            .cornerRadius(25)
            .background(.clear)
            .position(x: 95, y: 154)
        }
    }
}
