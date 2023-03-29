//
//  Color.swift
//  D-DAY
//
//  Created by Hakyung Sohn on 2023/01/30.
//

import UIKit

struct Color {
    let bgColor: UIColor?
    let txtColor: UIColor?
}

extension Color {
    static let colorList: [Color] = [
        Color(bgColor: UIColor(named: "ddayNeonHotPinkBrighter"), txtColor: UIColor(named: "ddayBlack")),
        Color(bgColor: UIColor(named: "ddayNeonEmeraldDeeper"), txtColor: UIColor(named: "ddayBabyPurple")),
        Color(bgColor: UIColor(named: "ddayBlack"), txtColor: UIColor(named: "ddayWhite")),
        Color(bgColor: UIColor(named: "ddayNeonYellow"), txtColor: UIColor(named: "ddayBlack")),
        
        Color(bgColor: UIColor(named: "ddayVintageBeige"), txtColor: UIColor(named: "ddayNavy")),
        Color(bgColor: UIColor(named: "ddayNavyDarker"), txtColor: UIColor(named: "ddayOrangeCheese")),
        Color(bgColor: UIColor(named: "ddayRipenPurple"), txtColor: UIColor(named: "ddayBabyPurpleBright")),
        Color(bgColor: UIColor(named: "ddayTonedownedPurpleDarker"), txtColor: UIColor(named: "ddayOrangeCheese")),
        
        Color(bgColor: UIColor(named: "ddayNeonOrange"), txtColor: UIColor(named: "ddayNeonGreanBrighter")),
        Color(bgColor: UIColor(named: "ddayNeonPurple"), txtColor: UIColor(named: "ddayNeonOrangeBrighter")),
        Color(bgColor: UIColor(named: "ddayBabyPink"), txtColor: UIColor(named: "ddayRadishBrown")),
        Color(bgColor: UIColor(named: "ddayLemonLight"), txtColor: UIColor(named: "ddaySkyBlueLight")),
        Color(bgColor: UIColor(named: "ddayNeonBlueBrighter"), txtColor: UIColor(named: "ddayYellow")),
        Color(bgColor: UIColor(named: "ddayNeonHotPink"), txtColor: UIColor(named: "ddayYellow")),
        
        Color(bgColor: UIColor(named: "ddayBeautifulOrange"), txtColor: UIColor(named: "ddayBlack")),
        Color(bgColor: UIColor(named: "ddayWhite"), txtColor: UIColor(named: "ddayBlack")),
        Color(bgColor: UIColor(named: "ddayBabyPurpleBrighter"), txtColor: UIColor(named: "ddayBabyPink")),
        Color(bgColor: UIColor(named: "ddayBabyPinkBright"), txtColor: UIColor(named: "ddayNeonLimeGreenDarker")),
        Color(bgColor: UIColor(named: "ddayTonedownedGreen"), txtColor: UIColor(named: "ddayOrangeBrighter")),
        Color(bgColor: UIColor(named: "ddayFlamingoPink"), txtColor: UIColor(named: "ddayBlack")),
        Color(bgColor: UIColor(named: "ddayToneDownHotPink"), txtColor: UIColor(named: "ddayLightOrange")),
        Color(bgColor: UIColor(named: "ddayNeonBlueBrighter"), txtColor: UIColor(named: "ddayNeonLimeGreen")),
        Color(bgColor: UIColor(named: "ddayNeonGreanBrighter"), txtColor: UIColor(named: "ddayBlack")),
    ]
}
