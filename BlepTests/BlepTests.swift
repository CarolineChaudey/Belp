//
//  BlepTests.swift
//  BlepTests
//
//  Created by Caroline Chaudey on 09/12/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import XCTest
@testable import Blep

class BlepTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTranslatorWantsAlphanumerics() {
        let translator = Translator()
        XCTAssertThrowsError(try translator.translate(text: "")) { error in
            XCTAssertEqual(error as! TranslationException, TranslationException.notAlphanumeric)
        }
        XCTAssertThrowsError(try translator.translate(text: "Hello world !")) { error in
            XCTAssertEqual(error as! TranslationException, TranslationException.notAlphanumeric)
        }
        XCTAssertThrowsError(try translator.translate(text: "1, 2, 3 ... go !")) { error in
            XCTAssertEqual(error as! TranslationException, TranslationException.notAlphanumeric)
        }
        XCTAssertNoThrow(try translator.translate(text: "Hello world"))
        XCTAssertNoThrow(try translator.translate(text: "1 2 3 go"))
    }
    
    func testTranslator() {
        let translator = Translator()
        do {
            let res = try translator.translate(text: "sos")
            print(morseAsString(morseCode: res))
            XCTAssertEqual(morseAsString(morseCode: res), "...|---|...")
        } catch {
            XCTFail()
        }
    }

}
