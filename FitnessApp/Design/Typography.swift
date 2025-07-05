//
//  Typography.swift
//  FitnessApp
//  
//
/*
 MIT License

 Copyright (c) 2023 Fullstacktuts LLC

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation
import UIKit

extension UIFont {
    
    convenience init(type: FontType, size: FontSize) {
        self.init(name: type.name, size: size.value)!
    }
    
    static func style(_ style: FontStyle) -> UIFont {
        return style.font
    }
    
}


enum FontType: String {
    
    case rubikBlack = "Rubik-Black"
    case rubikBlackItalic = "Rubik-BlackItalic"
    case rubikBold = "Rubik-Bold"
    case rubikMedium = "Rubik-Medium"
    case rubikMediumItalic = "Rubik-MediumItalic"
    case rubikRegular = "Rubik-Regular"
    case rubikSemiBold = "Rubik-SemiBold"
}

extension FontType {
    
    var name: String {
        return self.rawValue
    }
    
}

enum FontSize {
    case custom(Double)
    case theme(FontStyle)
    
}

extension FontSize {
    var value: Double {
        switch self {
        case .custom(let customSize):
            return customSize
        case .theme(let size):
            return size.size
        }
    }
}

enum FontStyle {
    
    case h1
    case h2
    case body
    case secondaryText
    case caption
    case category
    case formLabel
    case buttonTitle
}

extension FontStyle {
    
    var size: Double {
        switch self {
        case .h1:
            return 22
        case .h2:
            return 18
        case .body:
            return 16
        case .secondaryText:
            return 14
        case .caption:
            return 14
        case .formLabel:
            return 14
        case .category:
            return 15
        case .buttonTitle:
            return 15
        }
    }
    
    private var fontDescription: FontDescription {
        switch self {
        case .h1:
            return FontDescription(font: .rubikBlackItalic, size: .theme(.h1), style: .title1)
        case .h2:
            return FontDescription(font: .rubikMedium, size: .theme(.h2), style: .title2)
        case .body:
            return FontDescription(font: .rubikRegular, size: .theme(.body), style: .body)
        case .secondaryText:
            return FontDescription(font: .rubikRegular, size: .theme(.secondaryText), style: .body)
        case .caption:
            return FontDescription(font: .rubikRegular, size: .theme(.caption), style: .caption1)
        case .category:
            return FontDescription(font: .rubikBold, size: .theme(.category), style: .body)
        case .formLabel:
            return FontDescription(font: .rubikSemiBold, size: .theme(.formLabel), style: .caption1)
        case .buttonTitle:
            return FontDescription(font: .rubikBold, size: .theme(.buttonTitle), style: .body)
        }
    }
    
    var font: UIFont {
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size.value) else {
            return UIFont.preferredFont(forTextStyle: fontDescription.style)
        }
        let fontMetrics = UIFontMetrics(forTextStyle: fontDescription.style)
        return fontMetrics.scaledFont(for: font)
    }
    
}

private struct FontDescription {
    let font: FontType
    let size: FontSize
    let style: UIFont.TextStyle
}
