//
//  LoginProtocols.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import Foundation
protocol LoginViewModelProtocol: ObservableObject {
    var email: String { get set }
    var isEmailValid: Bool { get }

    func login()

}
