//: Playground - noun: a place where people can play

import UIKit
import XCTest


class MainTests: XCTestCase {
    let inputInvalid = [
        "[2017-01-32 10:20:22] - Door open OK",
        "[2017-01-31 10:20:22] - Door open",
        "[2017-22-31 10:20:22] - Door open OK"
    ]


    let inputValid = [
        "[2017-01-31 09:20:22] - Door open OK",
        "[2017-01-31 10:20:22] - Door open OK",
        "[2017-01-31 11:20:22] - Door open OK",
        "[2017-01-31 12:20:22] - Door open OK",
        "[2017-01-31 13:20:22] - Door open OK",
        "[2017-01-31 17:20:22] - Door open OK",
        "[2017-02-31 19:20:22] - Door open OK"
    ]

    func testDates() {
        let main = Main()
        XCTAssertEqual(main.countInTimeRange(arr: inputValid), 4)
    }

    func testValidate() {
        let main = Main()
        inputValid.forEach { (value) in
            XCTAssertTrue(main.validate(str: value))
        }
        inputInvalid.forEach { (value) in
            XCTAssertFalse(main.validate(str: value))
        }

    }
}

class Main {

    func countInTimeRange(arr: Array<String>) -> Int {
        var i = 0
        arr.forEach { (value) in
            if (validate(str: value)) {
                let components = value.components(separatedBy: " - ")
                let dateString  = components[0]
                let date = dateStringToDate(dateString: dateString)
                if (isInTimeRange(date: date) ) {
                    i += 1
                }
            }
        }
        return i
    }

    func isInTimeRange(date: Date?) -> Bool {
        guard let d = date else { return false }
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: d)

        return hour >= 10 && hour < 16
    }

    func validate(str: String) -> Bool{
        let components = str.components(separatedBy: " - ")

        if(!validateComponents(components: components)){
            return false
        }

        let message = components[1]
        if(!validateMessage(message: message)){
            return false
        }

        let dateString = components[0]
        if(!validateDateString(dateString: dateString)){
            return false
        }

        return true
    }

    private func validateComponents(components: [String]) -> Bool {
        return components.count == 2
    }

    private func validateMessage(message: String) -> Bool {
        if message != "Door open OK" { return false }
        return true
    }

    private func dateStringToDate(dateString: String) -> Date? {
        let date = dateString.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormat.date(from: date)
    }

    private func validateDateString(dateString: String) -> Bool {
        return dateStringToDate(dateString: dateString) != nil
    }
}

MainTests.defaultTestSuite().run()


