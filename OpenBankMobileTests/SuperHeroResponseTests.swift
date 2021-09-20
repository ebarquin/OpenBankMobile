//
//  SuperHeroResponseTests.swift
//  OpenBankMobileTests
//
//  Created by Eugenio Barquín on 20/9/21.
//

import XCTest

@testable import OpenBankMobile

class SuperHeroResponseTests: XCTestCase {
    
    func test_transform_http_to_hhtps() {
        let sut = makeSut()
        
        XCTAssertEqual("https://google.com/picture.jpg", sut.addExtensionTo(imageUrl:"http://google.com/picture"))
    }
    
    private func makeSut() -> SuperHeroResponse {
    return SuperHeroResponse(id: 1, name: "Iron Man", description: "Description", thumbnail: SuperHeroThumbnailResponse(path: "http://google.com/picture"))
    }
}
