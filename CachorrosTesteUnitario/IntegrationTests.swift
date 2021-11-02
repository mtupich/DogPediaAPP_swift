//
//  IntegrationTests.swift
//  CachorrosTests
//
//  Created by Maria Eduarda Tupich on 29/10/21.
//


import XCTest
@testable import Cachorros

class IntegrationTests: XCTestCase {
    
        func testAPIntegration() {
            
            let api = API()
            let sut = ViewController(api: api)
            sut.loadViewIfNeeded()
            
            sleep(5)
            guard sut.arrayCachorros.count > 0 else {
                XCTFail()
                return
            }
            let caracteresDoNomeDoPrimeiroCachorro = sut.arrayCachorros[0].name?.count ?? 0
            XCTAssertTrue(caracteresDoNomeDoPrimeiroCachorro > 0)
        }

}
