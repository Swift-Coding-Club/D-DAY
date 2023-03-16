//
//  WidigetView_Multi04_L_Comp01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/14.
//

import SwiftUI

struct WidgetView_Multi04_L_Comp01: View { // disable shadow
    
    var entry: Provider.Entry
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Text("아빠 60번째 생일기념 여행")
                    .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                    .frame(width: 70, height: 55, alignment: .topTrailing)
                    .multilineTextAlignment(.trailing)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                    .foregroundColor(Color("ddayNeonEmerald"))
                
                Text("2023.12.31")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 70, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 195, trailing: 0))
                    .foregroundColor(Color("ddayNeonEmerald"))
            
                
                Text("-124")
                    .font(.custom("Inter-Bold", size: 110.0))
                    .frame(width: 400, height: 50, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 25, trailing: 0))
                    .kerning(-9)
                    .rotationEffect(.degrees(-100))
                    .foregroundColor(Color("ddayNeonEmerald"))
                
            }
            .frame(width: 80, height: 400)
            .background(Color("ddayBabyPurple"))
            .clipped()
            
            ZStack {
                Text("호주유학")
                    .font(.custom("Inter-Bold", size: 14.0)) // 4- 14, 3~5-12, <8=-11,  많이-9
                    .frame(width: 70, height: 55, alignment: .topTrailing)
                    .multilineTextAlignment(.trailing)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                    .foregroundColor(Color("ddayBabyPurple"))
                
                Text("2023.12.31")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 70, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 195, trailing: 0))
                    .foregroundColor(Color("ddayBabyPurple"))
            
                
                Text("-43")
                    .font(.custom("Inter-Bold", size: 110.0))
                    .frame(width: 400, height: 400, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 25, trailing: 0))
                    .clipped()
                    .kerning(-9)
                    .rotationEffect(.degrees(-100))
                    .foregroundColor(Color("ddayBabyPurple"))
            }
            .frame(width: 80, height: 400)
            .clipped()
            
            ZStack {
                Text("미국여행")
                    .font(.custom("Inter-Bold", size: 14.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                    .frame(width: 70, height: 55, alignment: .topTrailing)
                    .multilineTextAlignment(.trailing)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                    .foregroundColor(Color("ddayNeonEmerald"))
                
                Text("2023.12.31")
                    .font(.custom("Inter-Bold", size: 12.0))
                    .frame(width: 70, height: 50, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 195, trailing: 0))
                    .foregroundColor(Color("ddayNeonEmerald"))
            
                
                Text("+999")
                    .font(.custom("Inter-Bold", size: 96.0))
                    .frame(width: 400, height: 50, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 25, trailing: 0))
                    .kerning(-9)
                    .rotationEffect(.degrees(-100))
                    .foregroundColor(Color("ddayNeonEmerald"))
            }
            .frame(width: 80, height: 400)
            .background(Color("ddayBabyPurple"))
            .clipped()
            
        }
        .frame(width: 400, height: 400)
        .background(Color("ddayNeonEmerald"))
        
    }
}
