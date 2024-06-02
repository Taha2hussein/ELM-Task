//
//  APIRouter.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import Foundation
import Alamofire

protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String  { get }
    var parameters: Parameters?  { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders { get }

}

extension APIRouter {
    func asURLRequest() throws -> URLRequest {
        guard var url: URL = URL(string: NetworkConstants.baseUrl) else {
            throw ElmError.URLNotValid
        }
        url.appendPathComponent(path)
        var headers: HTTPHeaders = []
        headers.add(HTTPHeader(name: "Authorization", value: ""))
        let request = try URLRequest(url: url, method: method, headers: headers)
        return try encoding.encode(request, with: parameters)
    }
}
