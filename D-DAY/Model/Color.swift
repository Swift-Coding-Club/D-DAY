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
        Color(bgColor: UIColor(named: "ddayNeonCrimson"), txtColor: UIColor(named: "ddayOrangeLighter")),
        Color(bgColor: UIColor(named: "ddayToneDownHotPink"), txtColor: UIColor(named: "ddayLightOrange")),
        Color(bgColor: UIColor(named: "ddayNeonPink"), txtColor: UIColor(named: "ddayBlack")),
        Color(bgColor: UIColor(named: "ddayNeonHotPinkBrighter"), txtColor: UIColor(named: "ddayWhite")),
        Color(bgColor: UIColor(named: "ddayNeonBlueBrighter"), txtColor: UIColor(named: "ddayNeonLimeGreen")),
        Color(bgColor: UIColor(named: "ddayNeonBlueDarker"), txtColor: UIColor(named: "ddayNeonSkyBlue")),
        Color(bgColor: UIColor(named: "ddayBlack"), txtColor: UIColor(named: "ddayWhite")),
        Color(bgColor: UIColor(named: "ddayNeonOrange"), txtColor: UIColor(named: "ddayNeonGreanBrighter")),
        Color(bgColor: UIColor(named: "ddayCharcoalBlack"), txtColor: UIColor(named: "ddayPurple")),
        Color(bgColor: UIColor(named: "ddayNeonYellow"), txtColor: UIColor(named: "ddayBlack")),
        Color(bgColor: UIColor(named: "ddayBabyPink"), txtColor: UIColor(named: "ddayToneDownPink")),
        Color(bgColor: UIColor(named: "ddayNeonRed"), txtColor: UIColor(named: "ddayBabyPink")),
        Color(bgColor: UIColor(named: "ddayNeonPurple"), txtColor: UIColor(named: "ddayNeonEmerald")),
        Color(bgColor: UIColor(named: "ddayNeonBlueBrighter"), txtColor: UIColor(named: "ddayYellow")),
        Color(bgColor: UIColor(named: "ddayNeonHotPink"), txtColor: UIColor(named: "ddayYellow")),
        Color(bgColor: UIColor(named: "ddayToneDownBabyPink"), txtColor: UIColor(named: "ddayReddishCrimson")),
        Color(bgColor: UIColor(named: "ddayWhite"), txtColor: UIColor(named: "ddayBlack")),
        Color(bgColor: UIColor(named: "ddayNeonGreen"), txtColor: UIColor(named: "ddayBlack")),
        Color(bgColor: UIColor(named: "ddayNeonOrangeBrighter"), txtColor: UIColor(named: "ddayWhite")),
        Color(bgColor: UIColor(named: "ddayWhite"), txtColor: UIColor(named: "ddayNeonHotPink")),
        Color(bgColor: UIColor(named: "ddayNeonEmeraldDeeper"), txtColor: UIColor(named: "ddayBabyPurple")),
        Color(bgColor: UIColor(named: "ddaySkinBrightColor"), txtColor: UIColor(named: "ddaySkinColor")),
    ]
}
