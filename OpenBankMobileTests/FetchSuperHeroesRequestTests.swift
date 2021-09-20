//
//  FetchSuperHeroesRequestTests.swift
//  OpenBankMobileTests
//
//  Created by Eugenio Barquín on 15/9/21.
//

import XCTest
import Alamofire

@testable import OpenBankMobile

class FetchSuperHeroesRequestTests: XCTestCase {
    
    func test_request_returnedGetMethod() {
        let sut = makeSut()
        XCTAssertEqual(HTTPMethod.get, sut.method)
    }
        
    private func makeSut() -> SuperHeroesServiceRequest {
        
        return SuperHeroesServiceRequest.fetchSuperHeroes
    }

}
