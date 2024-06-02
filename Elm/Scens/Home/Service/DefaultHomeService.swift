//
//  DefaultHomeService.swift
//  Elm
//
//  Created by Taha Hussein on 02/06/2024.
//

import Foundation
class DefaultHomeService: Service {
    
    let network: NetworkClient
    init(network: NetworkClient = NetworkClient()) {
        self.network = network
    }
    
    func fetchIncidents(completion: @escaping (IncidentsModel?) -> Void) {
        network.performRequest(IncidentsModel.self, router: HomeRouter.fetchIncendents) { result in
            
            switch result {
            case .success(let data):
                print(data)
                completion(data)
            case .failure(let fail):
                print(fail)
                completion(nil)
            }
        }
    }
}
