//
//  CalculatorBrainTests.swift
//  Calculator
//
//  Created by Peter Vanhoef on 18/03/17.
//  Copyright © 2017 Peter Vanhoef. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorBrainTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetOperand() {
        var testBrain = CalculatorBrain()
        testBrain.setOperand(5.0)
        XCTAssertEqual(testBrain.result, 5.0)
    }
    
    func testPerformOperation() {
        var testBrain = CalculatorBrain()
        
        testBrain.setOperand(81)
        testBrain.performOperation("√")
        XCTAssertEqual(testBrain.result, 9)
        
        testBrain.setOperand(129)
        testBrain.performOperation("±")
        XCTAssertEqual(testBrain.result, -129)

        testBrain.setOperand(5)
        testBrain.performOperation("×")
        testBrain.setOperand(8)
        testBrain.performOperation("=")
        XCTAssertEqual(testBrain.result, 40)

        testBrain.setOperand(4)
        testBrain.performOperation("+")
        testBrain.setOperand(9)
        testBrain.performOperation("=")
        XCTAssertEqual(testBrain.result, 13)

        testBrain.setOperand(3)
        testBrain.performOperation("−")
        testBrain.setOperand(10)
        testBrain.performOperation("=")
        XCTAssertEqual(testBrain.result, -7)

        testBrain.setOperand(6)
        testBrain.performOperation("÷")
        testBrain.setOperand(2)
        testBrain.performOperation("=")
        XCTAssertEqual(testBrain.result, 3)
        
        testBrain.performOperation("π")
        testBrain.performOperation("cos")
        XCTAssertEqual(testBrain.result, -1)
    }
    
    func testAdditionalOperationsTask3() {
        var testBrain = CalculatorBrain()
        
        testBrain.setOperand(0)
        testBrain.performOperation("sin")
        XCTAssertEqual(testBrain.result, 0)
        
        testBrain.setOperand(0)
        testBrain.performOperation("tan")
        XCTAssertEqual(testBrain.result, 0)
        
        testBrain.setOperand(18)
        testBrain.performOperation("x²")
        XCTAssertEqual(testBrain.result, 324)
        
        testBrain.setOperand(4)
        testBrain.performOperation("x⁻¹")
        XCTAssertEqual(testBrain.result, 0.25)
    }
    
    func testResultIsPendingTask5() {
        var testBrain = CalculatorBrain()

        testBrain.setOperand(4)
        XCTAssertFalse(testBrain.resultIsPending)
        testBrain.performOperation("+")
        XCTAssertTrue(testBrain.resultIsPending)
        testBrain.setOperand(9)
        testBrain.performOperation("=")
        XCTAssertFalse(testBrain.resultIsPending)
        XCTAssertEqual(testBrain.result, 13)
    }
}
