//
//  APIConfiguration.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 15/9/21.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    func asURLRequest() throws -> URLRequest
}

extension APIConfiguration {
    func asURLRequest() throws -> URLRequest {
        let url: URL
        url = try (Constants.HOST_URL + "\(path)").asURL()
        var request = URLRequest(url: url.absoluteURL,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10)
        // HTTP Method
        request.httpMethod = method.rawValue
        
        // Parameters
        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return request
    }
}
