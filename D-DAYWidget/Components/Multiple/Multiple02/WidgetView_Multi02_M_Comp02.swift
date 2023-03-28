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
        
        let defaultStringArr: [[String]] = [
            // format: [ddayTitle, ddayDate, ddayBgColor, ddayTxtColor, ddayIsCountdown]
            ["길게눌러서 디데이 추가하기", "2023.08.04", "ddayNeonGreen", "ddayBlack", "false"],
            ["길게눌러서 디데이 추가하기", "2023.10.04", "ddayNeonCrimson", "ddayOrangeLighter", "false"],
            ["길게눌러서 디데이 추가하기", "2023.11.04", "ddayNeonSkyBlue", "ddayYellow", "false"],
            ["길게눌러서 디데이 추가하기", "2023.04.04", "ddayNeonPurple", "ddayNeonEmerald", "false"],
            ["길게눌러서 디데이 추가하기", "2023.10.14", "ddayNeonPink", "ddayWhite", "false"],
            ["길게눌러서 디데이 추가하기", "2025.05.04", "ddayNeonBlueDarker", "ddayChristmasRed", "false"],
        ]
        
        let defaultDdaySymbolMenu: [DdaySymbol] = defaultStringArr.map { sArray in
            let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
            symbolDdayItem.ddayTitle = sArray[0]
            symbolDdayItem.ddayDate = sArray[1]
            symbolDdayItem.ddayBgColor = sArray[2]
            symbolDdayItem.ddayTxtColor = sArray[3]
            symbolDdayItem.ddayIsCountdown = sArray[4]
            
            return symbolDdayItem
        }
        
        let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
        
        ZStack{
            
            Group {
                
                // top stack 4
                switch ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayNeonEmerald" {
                case "ddayBlack":
                    Text(ddaySymbolMenu[safe: 3]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 180, y: -42)
                        .rotationEffect(.degrees(-90))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayBgColor ?? "ddayNeonEmerald"))

                default:
                    Text(ddaySymbolMenu[safe: 3]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 180, y: -42)
                        .rotationEffect(.degrees(-90))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayNeonEmerald"))
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hex: ddaySymbolMenu[safe: 3]?.ddayBgColor ?? "ddayNeonPurple"))
                        .frame(width: 110, height: 90)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 50.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 44, y: 19)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayNeonEmerald"))
                    
                    Text(ddaySymbolMenu[safe: 3]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 8.0))
                        .frame(width: 85, height: 50, alignment: .topTrailing)
                        .position(x: 50, y: 45)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayNeonEmerald"))
                    
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 3]?.ddayDate ??  defaultStringArr[3][1]), isTodayCounted: ddaySymbolMenu[safe: 3]?.ddayIsCountdown ?? "false")))")
                        .font(.custom("Inter-Bold", size: 57.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 73, y: 60)
                        .rotationEffect(.degrees(-6))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 3]?.ddayTxtColor ?? "ddayNeonEmerald"))
                }
                .frame(width: 110, height: 90)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 68, y: 134)
                
                
                // top stack 5
                switch ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayWhite" {
                case "ddayBlack":
                    Text(ddaySymbolMenu[safe: 4]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 181, y: 194)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayBgColor ?? "ddayWhite"))

                default:
                    Text(ddaySymbolMenu[safe: 4]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 181, y: 194)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayWhite"))
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(hex: ddaySymbolMenu[safe: 4]?.ddayBgColor ?? "ddayNeonPink"))
                        .frame(width: 115, height: 67)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 44.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 46, y: 8)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayWhite"))
                    
                    Text(ddaySymbolMenu[safe: 4]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 8.0))
                        .frame(width: 85, height: 50, alignment: .topTrailing)
                        .position(x: 55, y: 30)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayWhite"))
                    
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 4]?.ddayDate ??  defaultStringArr[4][1]), isTodayCounted: ddaySymbolMenu[safe: 4]?.ddayIsCountdown ?? "false")))")
                        .font(.custom("Inter-Bold", size: 47.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .kerning(-5)
                        .position(x: 75, y: 47)
                        .rotationEffect(.degrees(-6))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 4]?.ddayTxtColor ?? "ddayWhite"))
                }
                .frame(width: 115, height: 67)
                .cornerRadius(20)
                .background(.clear)
                .position(x: 170, y: 134)
            }
            
            
            Group {
                // top stack 1
                switch ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen" {
                case "ddayBlack":
                    Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 74, y: 50)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonGreen"))

                default:
                    Text(ddaySymbolMenu[safe: 0]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 74, y: 50)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayNeonGreen"))
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hex: ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayNeonGreen"))
                        .frame(width: 150, height: 70)
                    
                    Text("D")
                        .font(.custom("Inter-ExtraBold", size: 50.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .position(x: 48, y: 4)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 9.0))
                        .frame(width: 90, height: 50, alignment: .topTrailing)
                        .position(x: 65, y: 32)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                    
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate ??  defaultStringArr[0][1]), isTodayCounted: ddaySymbolMenu[safe: 0]?.ddayIsCountdown ?? "false")))")
                        .font(.custom("Inter-Bold", size: 51.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 78, y: 50)
                        .rotationEffect(.degrees(-4))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayBlack"))
                }
                .frame(width: 150, height: 70)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 75, y: 70)
                
                
                // top stack 6
                switch ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayChristmasRed" {
                case "ddayBlack":
                    Text(ddaySymbolMenu[safe: 5]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 239, y: 194)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayBgColor ?? "ddayChristmasRed"))

                default:
                    Text(ddaySymbolMenu[safe: 5]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 239, y: 194)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayChristmasRed"))
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hex: ddaySymbolMenu[safe: 5]?.ddayBgColor ?? "ddayNeonBlueDarker"))
                        .frame(width: 149, height: 81)
                    
                    Text("D")
                        .font(.custom("Inter-ExtraBold", size: 50.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 48, y: 10)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayChristmasRed"))
                    
                    Text(ddaySymbolMenu[safe: 5]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 9.0))
                        .frame(width: 97, height: 50, alignment: .topTrailing)
                        .position(x: 60, y: 38)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayChristmasRed"))
                    
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 5]?.ddayDate ??  defaultStringArr[5][1]), isTodayCounted: ddaySymbolMenu[safe: 5]?.ddayIsCountdown ?? "false")))")
                        .font(.custom("Inter-Bold", size: 53.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 71, y: 54)
                        .rotationEffect(.degrees(-6))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 5]?.ddayTxtColor ?? "ddayChristmasRed"))
                }
                .frame(width: 149, height: 81)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 296, y: 141)
            }
            
            
            Group {
                
                // top stack 3
                switch ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow" {
                case "ddayBlack":
                    Text(ddaySymbolMenu[safe: 2]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 162, y: -41)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayBgColor ?? "ddayYellow"))
                        .rotationEffect(.degrees(90))
                    
                default:
                    Text(ddaySymbolMenu[safe: 2]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 162, y: -41)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                        .rotationEffect(.degrees(90))
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hex: ddaySymbolMenu[safe: 2]?.ddayBgColor ?? "ddayNeonSkyBlue"))
                        .frame(width: 119, height: 85)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 54.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 64, y: 8)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                    
                    Text(ddaySymbolMenu[safe: 2]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 8.0))
                        .frame(width: 85, height: 70, alignment: .topTrailing)
                        .position(x: 68, y: 46)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                    
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 2]?.ddayDate ??  defaultStringArr[2][1]), isTodayCounted: ddaySymbolMenu[safe: 2]?.ddayIsCountdown ?? "false")))")
                        .font(.custom("Inter-Bold", size: 59.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 91, y: 55)
                        .rotationEffect(.degrees(-6))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 2]?.ddayTxtColor ?? "ddayYellow"))
                }
                .frame(width: 119, height: 85)
                .cornerRadius(25)
                .background(.clear)
                .position(x: 266, y: 67)
                
                
                
                // top stack 2
                switch ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter" {
                case "ddayBlack":
                    Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 132, y: 50)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayOrangeLighter"))

                default:
                    Text(ddaySymbolMenu[safe: 1]?.ddayDate ?? "2023.00.00")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 120, height: 50, alignment: .topLeading)
                        .position(x: 132, y: 50)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hex: ddaySymbolMenu[safe: 1]?.ddayBgColor ?? "ddayNeonCrimson"))
                        .frame(width: 119, height: 81)
                    
                    Text("D")
                        .font(.custom("Inter-Bold", size: 57.0))
                        .frame(width: 80, height: 50, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .position(x: 48, y: 5)
                        .rotationEffect(.degrees(-10))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                    
                    Text(ddaySymbolMenu[safe: 1]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-ExtraBold", size: 9.0))
                        .frame(width: 97, height: 50, alignment: .topTrailing)
                        .position(x: 60, y: 35)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
                    
                    Text("\(CustomFunctions().dateIntSign(dateIntParam: CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 1]?.ddayDate ??  defaultStringArr[1][1]), isTodayCounted: ddaySymbolMenu[safe: 1]?.ddayIsCountdown ?? "false")))")
                        .font(.custom("Inter-Bold", size: 58.0))
                        .frame(width: 150, height: 60, alignment: .topLeading)
                        .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                        .kerning(-5)
                        .position(x: 73, y: 52)
                        .rotationEffect(.degrees(-6))
                        .foregroundColor(Color(hex: ddaySymbolMenu[safe: 1]?.ddayTxtColor ?? "ddayOrangeLighter"))
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
