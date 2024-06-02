//
//  HomeRouter.swift
//  Elm
//
//  Created by Taha Hussein on 02/06/2024.
//

import Foundation
import Alamofire

enum HomeRouter: APIRouter {
    case fetchIncendents
    var method: HTTPMethod {
        switch self {
        case .fetchIncendents:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchIncendents:
            return "/incident"
    
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchIncendents:
            return nil
            
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchIncendents:
            return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .fetchIncendents:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return  headers
        }
    }
}
