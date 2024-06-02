//
//  LoginViewModel.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import SwiftUI
class LoginViewModel: LoginViewModelProtocol {
    @Published var email: String = ""
    @Published var loginModel: LoginModel?
    private let loginService: Service
  
    
    init(loginService: Service = DefaultLoginService()) {
        self.loginService = loginService
    }
    
    var isEmailValid: Bool {
        return loginService.isValidEmail(email)
    }
    
    func login() {
        loginModel = loginService.login(email: email)
        print(loginModel == nil)
    }
}

struct GeneralView: View {
    var body: some View {
        Text("Welcome to the General View")
            .navigationTitle("General")
    }
}
