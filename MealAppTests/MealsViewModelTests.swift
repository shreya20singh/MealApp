//
//  MealsViewModelTests.swift
//  MealAppTests
//
//  Created by Shreya Singh on 1/16/24.
//

import Foundation
import XCTest
@testable import MealApp

class MealsViewModelTests: XCTestCase {

    var sut: MealsViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MealsViewModel(apiService: MockDataService())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testFetchMeals() {
        let expectation = XCTestExpectation(description: "Fetch Meals")

        sut.fetchMeals()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertNotNil(self.sut.meals, "Meals should not be nil")
            //XCTAssertGreaterThan(self.sut.meals.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3.0)
    }
}
