//
//  LoginView.swift
//  CoopDukaAssessment
//
//  Created by Julius on 23/03/2026.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginViewModel()
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    
    var body: some View {

        VStack {
            Image("cblogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 150)
            Text("Welcome to a New Banking Experience")
            Text("Dream it. Achieve it.")
        }
        .padding(20)
        
        VStack {
            Button(action: {
                print("clicked registration")
                
            }) {
                Text("Already registered on the new platform?")
                    .foregroundColor(.primary)
                    .bold()
            }
            .buttonStyle(.borderless)
        }
        
        VStack(spacing: 20) {
            Text("Use your credentials to log in")
            
            TextField("Username", text: $vm.username)
                .padding(.bottom, 8)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.black)
            SecureField("Password", text: $vm.password)
                .padding(.bottom, 8)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.black)
            
            Button(action: {
                print("Login btn clicked")
                isLoggedIn = true
                
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 16)
            
        }
        .padding()
        
    }
}

#Preview {
    LoginView()
}
