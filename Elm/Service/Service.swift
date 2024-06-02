//
//  Service.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import SwiftUI
protocol Service {
    func isValidEmail(_ email: String) -> Bool
    func login(email: String) -> LoginModel?
    func fetchIncidents(completion: @escaping (IncidentsModel?) -> Void)
}

extension Service {
    func login(email: String) -> LoginModel? {
        return nil
    }

    func fetchIncidents(completion: @escaping (IncidentsModel?) -> Void) { }
}

extension Service {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
}
