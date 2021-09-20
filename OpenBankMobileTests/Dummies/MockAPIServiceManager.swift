//
//  MockAPIServiceManager.swift
//  OpenBankMobileTests
//
//  Created by Eugenio Barquín on 20/9/21.
//

import Alamofire
import RxSwift

@testable import OpenBankMobile

class MockAPIServiceManager: APIClientDefault {
    
    private let apiClient: APIClient
    
    init(responseJSONFile: String = "Empty") {
        self.apiClient = MockApiClient(requestResponseJSONFile: responseJSONFile)
    }
    
    override func request<T>(_ urlConvertible: URLRequestConvertible) -> Observable<T?> where T : Decodable {
        return apiClient.request(urlConvertible)
    }
}
