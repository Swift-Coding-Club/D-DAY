//
//  UIColorExtension.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/03/18.
//

import Foundation
import UIKit

extension UIColor {

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }

    convenience init?(hexRGBA: String?) {
        guard let rgba = hexRGBA, let val = Int(rgba.replacingOccurrences(of: "#", with: ""), radix: 16) else {
            return nil
        }
        self.init(red: CGFloat((val >> 24) & 0xff) / 255.0, green: CGFloat((val >> 16) & 0xff) / 255.0, blue: CGFloat((val >> 8) & 0xff) / 255.0, alpha: CGFloat(val & 0xff) / 255.0)
    }

    convenience init?(hexRGB: String?) {
        guard let rgb = hexRGB else {
            return nil
        }
        self.init(hexRGBA: rgb + "ff")
    }

}



public extension UIColor {

    /// Create color from RGB(A)
    ///
    /// Parameters:
    ///  - absoluteRed: Red value (between 0 - 255)
    ///  - green:       Green value (between 0 - 255)
    ///  - blue:        Blue value (between 0 - 255)
    ///  - alpha:       Blue value (between 0 - 255)
    ///
    /// Returns: UIColor instance.
    convenience init(absoluteRed red: Int, green: Int, blue: Int) {
        let normalizedRed = CGFloat(red) / 255.0
        let normalizedGreen = CGFloat(green) / 255.0
        let normalizedBlue = CGFloat(blue) / 255.0
        let normalizedAlpha = 255 / 255.0

        self.init(
            red: normalizedRed,
            green: normalizedGreen,
            blue: normalizedBlue,
            alpha: normalizedAlpha
        )
    }

    /// Create color from an hexadecimal integer value (e.g. 0xFFFFFF)
    ///
    /// Note:
    ///  - Based on: http://stackoverflow.com/a/24263296
    ///
    /// Parameters:
    ///  - hex: Hexadecimal integer for color
    ///
    /// Returns: UIColor instance.
    convenience init(hex: Int) {
        self.init(
            absoluteRed: (hex >> 16) & 0xff,
            green: (hex >> 8) & 0xff,
            blue: hex & 0xff
        )
    }

    /// Create color from an hexadecimal string value (e.g. "#FFFFFF" / "FFFFFF")
    ///
    /// Note:
    ///  - Based on: http://stackoverflow.com/a/27203691
    ///
    /// Parameters:
    ///  - hex: Hexadecimal string for color
    ///
    /// Returns: UIColor instance.
    convenience init?(hex: String) {
        var normalizedHexColor = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()

        if normalizedHexColor.hasPrefix("#") {
            normalizedHexColor = String(normalizedHexColor.dropFirst())
            
            // Convert to hexadecimal color (string) to integer
            var hex: UInt64 = 0
            Scanner(string: normalizedHexColor).scanHexInt64(&hex)
            
            self.init(
                hex: Int(hex)
            )
        } else {
            self.init(named: hex)
        }
    }
    
}
