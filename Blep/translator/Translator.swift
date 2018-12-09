//
//  Translator.swift
//  Blep
//
//  Created by Caroline Chaudey on 09/12/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import Foundation

class Translator {

    public func translate(text: String) throws -> [MorseSymbol] {
        var codedWord : [MorseSymbol] = []
        // verify it is alphanumeric
        guard text.isAlphanumeric else {
            throw TranslationException.notAlphanumeric
        }
        // put all letters in uppercase
        var upperCasedText = text.uppercased()
        // for each word
        // for each letter
        // for each symbol of a letter
        return codedWord
    }
    
    /*private func translateWord(word: String) -> [MorseSymbol] {
        var codedWord : [MorseSymbol] = []
        return codedWord
    }*/
}

extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9 ]", options: .regularExpression) == nil
    }
}
