//: Playground - noun: a place where people can play

//Input: "1+1i", "1+1i"
//Output: "0+2i"
//Explanation: (1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i, and you need convert it to the form of 0+2i.


import XCTest

struct ComplexNumber {
    var real: Int
    var imaginary: Int
    
    init(real: Int, imaginary: Int) {
        self.real = real
        self.imaginary = imaginary
    }
}

func stringToComplexNumber(string: String) -> ComplexNumber {
    if let index = string.characters.index(of: "+") {
        var stringArray = string.components(separatedBy: "+")
        let realPart = stringArray[0]
        let imaginaryPart = stringArray[1].replacingOccurrences(of: "i", with: "")
        return ComplexNumber(real: Int(realPart) ?? 0, imaginary: Int(imaginaryPart) ?? 0)
    }
    return ComplexNumber(real: 0, imaginary: 0)
}

func complexNumberToString(number: ComplexNumber) -> String {
    let realString = String(number.real)
    var imaginaryString = String(number.imaginary) + "i"
    
    if (number.imaginary >= 0) {
        imaginaryString = "+" + imaginaryString
    }
    
    return realString + imaginaryString
}

func multiplyComplexNumbers(struct1: ComplexNumber, struct2: ComplexNumber) -> ComplexNumber {
    let part1 = struct1.real * struct2.real
    let part2 = struct1.real * struct2.imaginary
    let part3 = struct1.imaginary * struct2.real
    let part4 = (struct1.imaginary * struct2.imaginary) * -1
    return ComplexNumber(real: part1 + part4, imaginary: part2 + part3)
}

func multiplyComplexNumberFromString(string1: String, string2: String) -> String {
    let number1 = stringToComplexNumber(string: string1)
    let number2 = stringToComplexNumber(string: string2)
    let multiplied = multiplyComplexNumbers(struct1: number1, struct2: number2)
    return complexNumberToString(number: multiplied)
}

class Tests: XCTestCase {
    
    func testStringToComplexNumber() {
        let testStruct = ComplexNumber(real: 1, imaginary: 1)
        let data = stringToComplexNumber(string: "1+1i")
        XCTAssert(data.real == testStruct.real)
        XCTAssert(data.imaginary == testStruct.imaginary)
    }
    
    func testComplexNumberToString() {
        let testStruct = ComplexNumber(real: 1, imaginary: 1)
        let string = complexNumberToString(number: testStruct)
        XCTAssert(string == "1+1i")
    }
    
    func testMultiplyComplexNumbers() {
        let testStruct1 = ComplexNumber(real: 1, imaginary: 1)
        let testStruct2 = ComplexNumber(real: 1, imaginary: 1)
        let result = multiplyComplexNumbers(struct1: testStruct1, struct2: testStruct2)
        
        let testResultStruct = ComplexNumber(real: 0, imaginary: 2)
        XCTAssert(result.real == testResultStruct.real)
        XCTAssert(result.imaginary == testResultStruct.imaginary)
    }

    func testMultiplyComplexNumberFromString() {
        let string1 = "1+1i"
        let string2 = "1+1i"
        let result = "0+2i"
        XCTAssert(multiplyComplexNumberFromString(string1: string1, string2: string2) == result)
    }
}

Tests.defaultTestSuite().run()

//participants
//alex
//endy
//dougs [s|k]
//b
//jojo -> mediador
//nicholas
//matheus
