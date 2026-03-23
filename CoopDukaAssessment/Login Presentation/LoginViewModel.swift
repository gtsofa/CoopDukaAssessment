//
//  LoginViewModel.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    @Published var errrorMessage: String? = nil
    
    var isLoginButtonDisabled: Bool {
        username.isEmpty || password.isEmpty
    }
    
    func login() {
        if username == "MB30123456" && password == "123456" {
            isAuthenticated = true
            errrorMessage = nil
        } else {
            errrorMessage = "Incorrect username and password"
        }
            
    }
    
    
}
