//: Playground - noun: a place where people can play

import UIKit
import XCTest


class MainTests: XCTestCase {
    var numbersToTest = [1,2,3,4,5,6]

    func testSum() {
        let main = Main()
        for i in numbersToTest {
            XCTAssertEqual(main.sum(i, y: i + 1), i + (i + 1))
            XCTAssertNotEqual(main.sum(i, y: i + 2), i + i)
        }
    }

    func testMultiply() {
        let main = Main()
        for i in numbersToTest {
            XCTAssertEqual(main.multiply(i, y: i + 1), i * (i + 1))
            XCTAssertNotEqual(main.multiply(i, y: i + 2), i + i)
        }
    }
}

class Main {

    fileprivate func sum(_ x:Int, y:Int) -> Int {
        return x + y
    }

    fileprivate func multiply(_ x: Int, y:Int) -> Int{
        return x * y
    }

}

MainTests.defaultTestSuite().run()


