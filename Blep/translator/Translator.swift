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
        let upperCasedText = text.uppercased()
        // for each word
        codedWord = translateWord(word: upperCasedText)
        return codedWord
    }
    
    private func translateWord(word: String) -> [MorseSymbol] {
        var codedWord : [MorseSymbol] = []

        word.forEach { letter in
            if var codedLetter = letterTranslater[letter] {
                codedLetter = addPartSeparators(morseLetter: codedLetter)
                codedWord += codedLetter
                codedWord.append(MorseSymbol.letterSeparator)
            } else {
                print("Problem with letter \(letter)")
            }
        }
        // remove the last letterSeparator, since it is the end of the word
        codedWord.removeLast()

        return codedWord
    }
    
    private func addPartSeparators(morseLetter: [MorseSymbol]) -> [MorseSymbol] {
        var codedLetter : [MorseSymbol] = []
        
        morseLetter.forEach { symbol in
            codedLetter.append(symbol)
            codedLetter.append(MorseSymbol.partSeparator)
        }
        // remove the last partSeparator, since it is the end of the letter
        codedLetter.removeLast()
        
        return codedLetter
    }
}

extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9 ]", options: .regularExpression) == nil
    }
}
