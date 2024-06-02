//
//  DefaultLoginService.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import Foundation

class DefaultLoginService: Service {
    let network: NetworkClient
    init(network: NetworkClient = NetworkClient()){
        self.network = network
    }
    
    func login(email: String) -> LoginModel? {
        // Perform login logic here
        if isValidEmail(email) {
            network.performRequest(LoginModel.self, router: LoginRouter.login(email: email)) { result in
                switch result {
                case .success(let data):
                    print(data)
                case .failure(let fail):
                    print(fail)
                }
            }
        } else {
            return nil
        }
        return nil
    }
}
