//
//  WidigetView_Multi05_L_Comp02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

struct WidgetView_Multi05_L_Comp02: View { // enable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Text("-124")
                    .font(.custom("Inter-Bold", size: 113.0))
                    .frame(width: 400, height: 50, alignment: .leading)
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .padding(EdgeInsets(top: 13, leading: 40, bottom: 25, trailing: 0))
                    .kerning(-8)
                    .rotationEffect(.degrees(-10))
                    .foregroundColor(Color("ddayNeonGreen"))
                
                Text("아빠 60번째 생일기념 여행")
                    .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                    .frame(width: 70, height: 55, alignment: .topTrailing)
                    .multilineTextAlignment(.trailing)
                    .padding(EdgeInsets(top: 0, leading: 240, bottom: 0, trailing: 0))
                    .lineLimit(3)
                    .foregroundColor(Color("ddayNeonGreen"))

                Text("2023.12.31")
                    .font(.custom("Inter-Bold", size: 10.0))
                    .frame(width: 70, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 80, leading: 240, bottom: 0, trailing: 0))
                    .foregroundColor(Color("ddayNeonGreen"))
            }
            .frame(width: 400, height: 80)
            .background(.black)
            .clipped()
            
            ZStack {
                Text("+34")
                    .font(.custom("Inter-Bold", size: 113.0))
                    .frame(width: 400, height: 50, alignment: .trailing)
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 70))
                    .kerning(-10)
                    .rotationEffect(.degrees(-10))
                    .foregroundColor(.black)
                
                Text("졸업여행")
                    .font(.custom("Inter-Bold", size: 14.0)) // 2- 16, 4- 14 5~-12
                    .frame(width: 70, height: 55, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 240))
                    .lineLimit(3)
                    .foregroundColor(.black)

                Text("2023.12.31")
                    .font(.custom("Inter-Bold", size: 10.0))
                    .frame(width: 70, height: 50, alignment: .topLeading)
                    .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 240))
                    .foregroundColor(.black)
            }
            .frame(width: 400, height: 80)
            .background(Color("ddayNeonGreen"))
            .clipped()
            
            ZStack {
                Text("30번째 생일")
                    .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                    .frame(width: 70, height: 55, alignment: .topTrailing)
                    .multilineTextAlignment(.trailing)
                    .padding(EdgeInsets(top: 0, leading: 240, bottom: 0, trailing: 0))
                    .lineLimit(3)
                    .foregroundColor(Color("ddayNeonGreen"))

                Text("2023.12.31")
                    .font(.custom("Inter-Bold", size: 10.0))
                    .frame(width: 70, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 80, leading: 240, bottom: 0, trailing: 0))
                    .foregroundColor(Color("ddayNeonGreen"))
                
                Text("-999")
                    .font(.custom("Inter-Bold", size: 113.0))
                    .frame(width: 400, height: 50, alignment: .leading)
                    .shadow(color: Color("ddayBlack").opacity(0.3), radius: 2.2, x: 0.6, y: 4)
                    .padding(EdgeInsets(top: 13, leading: 40, bottom: 25, trailing: 0))
                    .kerning(-9) // 124-8, 999- 9
                    .rotationEffect(.degrees(-10))
                    .foregroundColor(Color("ddayNeonGreen"))
            }
            .frame(width: 400, height: 80)
            .background(.black)
            .clipped()
            
        }
        .frame(width: 400, height: 400)
        .background(Color("ddayNeonGreen"))
    }
}
