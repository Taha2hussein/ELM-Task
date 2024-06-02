//
//  LoginView.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import SwiftUI


struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel = LoginViewModel()
    @StateObject var router: Router<ViewsRoute>
    
    init(router: Router<ViewsRoute>) {
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        VStack {
            TextField(Strings.email, text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(Strings.login) {
                viewModel.login()
                router.routeTo(.home)
            }
            .padding()
            .disabled(!viewModel.isEmailValid)
            
        }
        .padding()
        
    }
}

