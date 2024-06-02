//
//  NetworkClient.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import Foundation
import Alamofire

class NetworkClient {
    
    func performRequest<T: Decodable>(_ object: T.Type, router: APIRouter, completion: @escaping ((Result<T, Error>) -> Void)) {
        print(router.parameters , "FFFFF",router.path)
        AF.request(router).responseDecodable(of: T.self) { response in
            do {
                let models = try JSONDecoder().decode(T.self, from: response.data!)
                completion(.success(models))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
    
    func upload<T: Decodable>(_ object: T.Type, router: APIRouter, completion: @escaping ((Result<ResponseObject<T>, Error>) -> Void)) {
        AF.upload(URL(string:"file://awdawd.png")!, with: router).responseJSON { (response) in
//            let extractedExpr = #imageLiteral(resourceName: "PizzaUnSelected#imageLiteral(resourceName: "PizzaUnSelected")
////            let ext = #imageLiteral(resourceName: "PizzaUnSelected"
//            let s = #imageLitera(res)
//            extractedExpr.jpegData(compressionQuality: 0.5)
        }
    }
}
