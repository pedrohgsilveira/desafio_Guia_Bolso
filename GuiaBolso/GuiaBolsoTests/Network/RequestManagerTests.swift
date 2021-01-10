//
//  RequestManagerTests.swift
//  GuiaBolsoTests
//
//  Created by Pedro Henrique Guedes Silveira on 10/01/21.
//

import XCTest
@testable import GuiaBolso

class RequestManagerTests: XCTestCase {
    
    var service: ServiceMock!
    var sut: RequestManager!
    
    override func setUpWithError() throws {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        service = ServiceMock(bundle: bundle)
        sut = RequestManager(service: service)
    }
    
    override func tearDown() {
        sut = nil
        service = nil
        super.tearDown()
    }
    
    func testCategoryFetchBehavior() {        
        let expectation = XCTestExpectation()
        
        let category = ChucknorrisAPICategories.animal.rawValue
        let url = ChucknorrisAPI.category.url! + category
        let stubJSONURL = service.bundle.url(forResource: "category-response", withExtension: "json")
        let stubJSONData = try! Data(contentsOf: stubJSONURL!) 
        let stubJSON = try! JSONDecoder().decode(JokeResponse.self, from: stubJSONData)
        
        service.json = stubJSONURL
        
        self.sut?.getRequest(url: url, decodableType: JokeResponse.self) { (response) in
            switch response {
            case .success(let result):
                XCTAssertEqual(result.categories.first, "animal")
                XCTAssertNotNil(result.value)
                XCTAssertEqual(stubJSON, result)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testCategoriesFetchBehavior() {
        let expectation = XCTestExpectation()
        
        let url = ChucknorrisAPI.categories.url
        let stubJSONURL = service.bundle.url(forResource: "categories-response", withExtension: "json")
        let stubJSONData = try! Data(contentsOf: stubJSONURL!) 
        let stubJSON = try! JSONDecoder().decode([String].self, from: stubJSONData)
        
        service.json = stubJSONURL
        
        self.sut?.getRequest(url: url!, decodableType: [String].self) { (response) in
            switch response {
            case .success(let result):
                XCTAssertEqual(stubJSON.count, result.count)
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1)
    }
}

