//
//  APIError.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 15/9/21.
//

import Foundation

enum APIError: Error, Equatable {
    case badRequest(data: Data?)      //Status code 400
    case unauthorized           //Status code 401
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case notAcceptable          //Status code 406
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}
