//
//  MorseCode.swift
//  Blep
//
//  Created by Caroline Chaudey on 07/12/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import Foundation

let translater : [Character:[MorseSymbol]] = [
    "A": [.dot, .dash],
    "B": [.dash, .dot, .dot, .dot],
    "C": [.dash, .dot, .dash, .dot],
    "D": [.dash, .dot, .dot],
    "E": [.dot],
    "F": [.dot, .dot, .dash, .dot],
    "G": [.dash, .dash, .dot],
    "H": [.dot, .dot, .dot, .dot],
    "I": [.dot, .dot],
    "J": [.dot, .dash, .dash, .dash],
    "K": [.dash, .dot, .dash],
    "L": [.dot, .dash, .dot, .dot],
    "M": [.dash, .dash],
    "N": [.dash, .dot],
    "O": [.dash, .dash, .dash],
    "P": [.dot, .dash, .dash, .dot],
    "Q": [.dash, .dash, .dot, .dash],
    "R": [.dot, .dash, .dot],
    "S": [.dot, .dot, .dot],
    "T": [.dash],
    "U": [.dot, .dot, .dash],
    "V": [.dot, .dot, .dot, .dash],
    "W": [.dot, .dash, .dash],
    "X": [.dash, .dot, .dot, .dash],
    "Y": [.dash, .dot, .dash, .dash],
    "Z": [.dash, .dash, .dot, .dot],
    "1": [.dot, .dash, .dash, .dash, .dash],
    "2": [.dot, .dot, .dash, .dash, .dash],
    "3": [.dot, .dot, .dot, .dash, .dash],
    "4": [.dot, .dot, .dot, .dot, .dash],
    "5": [.dot, .dot, .dot, .dot, .dot],
    "6": [.dash, .dot, .dot, .dot, .dot],
    "7": [.dash, .dash, .dot, .dot, .dot],
    "8": [.dash, .dash, .dash, .dot, .dot],
    "9": [.dash, .dash, .dash, .dash, .dot],
    "0": [.dash, .dash, .dash, .dash, .dash]
]
