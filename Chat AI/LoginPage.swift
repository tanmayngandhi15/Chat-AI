//
//  LoginPage.swift
//  Chat AI
//

import SwiftUI

struct LoginPage: View {
    
        @State private var username: String = ""
        @State private var password: String = ""
        @State private var showingAlert = false
        @State private var loginSuccess = false
        @State private var alertMessage = ""
        @State private var navigateToAI = false
        @State private var showPassword = false

        var body: some View {
       
                ZStack {
                    
                    NavigationView {
      
                    VStack {
                        
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true).navigationBarHidden(true), isActive: $navigateToAI) {
                                        EmptyView()
                                    }
                        
                        Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.bottom, 20)
                            .foregroundStyle(.white)
                        
                        TextField("Enter a Username", text: $username)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                     
                        HStack {
                            
                            if showPassword {
                                
                                TextField("Enter a Password", text: $password)
                                    .frame(height: 22)
                            } else {
                                
                                SecureField("Enter a Password", text: $password)
                                    .frame(height: 22)
                            }
                            
                            Button(action: {
                                
                                showPassword.toggle()
                            }, label: {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.black)
                                
                            })
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .padding(.bottom, 20)

                        Button(action: {
                            signIn()
                        }) {
                            Text("Sign In")
                                .font(.system(size: 30).bold())
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 50)
                                .background(Color(red: 255.0/255.0, green: 118.0/255.0, blue: 174.0/255.0))
                                .cornerRadius(15.0)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK"), action: {
                            if loginSuccess {
                                navigateToAI = true
                            }
                        }))
                    }
                    .background(
                                    Image("bg_login")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        .ignoresSafeArea()
                                )
                  }
                }
                
        }
        

        func signIn() {
 
            if username.isEmpty {
                
                alertMessage = "Please enter username."
                showingAlert = true
            } else if password.isEmpty {
                
                alertMessage = "Please enter password."
                showingAlert = true
            }else {

                print("Username: \(username), Password: \(password)")
                alertMessage = "Sign in successful!"
                showingAlert = true
                loginSuccess = true
            }
        }
    }

#Preview {
    LoginPage()
}
