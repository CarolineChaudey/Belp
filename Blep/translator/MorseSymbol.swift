//
//  MorseSymbol.swift
//  Blep
//
//  Created by Caroline Chaudey on 07/12/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import Foundation

enum MorseSymbol : String {
    case dot = "."
    case dash = "-"
    case letterSeparator = "|"
    case wordSeparator = " "
    case partSeparator = "" // between a letter elements
}

func morseAsString(morseCode: [MorseSymbol]) -> String {
    var strCode = ""
    morseCode.forEach { symbol in
        strCode += symbol.rawValue
    }
    return strCode
}

func duration(symbol: MorseSymbol) -> Int {
    switch symbol {
    case .partSeparator, .dot:
        return 1
    case .dash, .letterSeparator:
        return 3
    case .wordSeparator:
        return 7
    }
}
