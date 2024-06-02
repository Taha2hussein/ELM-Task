//
//  LoginRouter.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import Foundation
import Alamofire

enum LoginRouter: APIRouter {
    case login(email: String)
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
    
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let email):
            return ["email": email]
            
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .login:
            return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .login:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return  headers
        }
    }
}


enum ElmError: Error {
    case URLNotValid
}
