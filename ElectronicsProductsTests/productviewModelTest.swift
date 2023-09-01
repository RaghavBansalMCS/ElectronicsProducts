//
//  productviewModelTest.swift
//  ClassProjectTests
//
//  Created by Consultant on 7/19/23.
//

import XCTest
@testable import ElectronicsProducts

final class productviewModelTest: XCTestCase {
    
    var productModel: productViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }
    
    func testingwithTheData() async throws{
        let fakeManager = FakeNetworkManager()
        productModel = await productViewModel(networkManager: fakeManager)
        
        await productModel.getProductsFromAPI(urlString: "TestAPI")
        
        XCTAssertNotNil(productModel)
        
        let productFile = await productModel.productsMain?.products
        XCTAssertEqual(productFile?.count, 30)
        
        let error = await productModel.customError
        XCTAssertNil(error)
        
        let product = productFile?.first
        XCTAssertEqual(product?.brand, "Apple")
        XCTAssertEqual(product?.description, "An apple mobile which is nothing like apple")
        XCTAssertEqual(product?.price, 549)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
