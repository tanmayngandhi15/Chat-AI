//
//  ContentView.swift
//  Chat AI
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    
    @State private var offset = CGSize.zero
    @State private var navigateToLogin = false
    @State var userPrompt = ""
    @State var userResponse = "How can i help you ?"
    @State var isLoading = false
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.ServerResponce)

        
    
    
    func buttonTapped() {
        
        if userPrompt != "" {
            hideKeyboard()
            genetareResponse()
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
    func genetareResponse() {
        
        isLoading = true
        
        Task {
            do {
                
                let result = try await
                model.generateContent(userPrompt)
                isLoading = false
                userResponse = result.text ?? "No Response"
                userPrompt = ""
            } catch {
                userResponse = "Something went wrong..!"
            }
        }
    }

    
    var body: some View {
        
        ZStack {
            
            NavigationView {

                VStack {
                    
                    NavigationLink(destination: LoginPage().navigationBarBackButtonHidden(true)
                       // .transition(.slideFromRight)
                        .navigationBarHidden(true), isActive: $navigateToLogin) {
                                    EmptyView()
                                }
                    
                    Label("Welcome to Chat AI", image: "")
                    //.bold()
                        .font(.title)
                        .foregroundColor(.purple)
                        .ignoresSafeArea(edges: .top)
                        .padding()
                        //.multilineTextAlignment(.center)
                    
                    ZStack {
                        ScrollView {
                            Text(verbatim: userResponse)
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                        
                        if isLoading {
                            
                            ProgressView()
                                .scaleEffect(4)
                            // .progressViewStyle(CircularProgressViewStyle())
                                .tint(.purple)
                            
                        }
                    }
                    
                    HStack {
                        TextField("Ask anything...", text: $userPrompt) // , axis: .vertical
                            .autocorrectionDisabled(true)
                            .lineLimit(2)
                            .padding()
                        
                        Button(action: {
                            
                            buttonTapped()
                        }) {
                            
                            Image(uiImage: .add)
                                .aspectRatio(contentMode: .fill)
                                .padding()
                        }
                        // .buttonStyle(PlainButtonStyle())
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(10)
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    .background(Color.white, in: Capsule())
                    .edgesIgnoringSafeArea(.bottom)
                    .padding()
                    
                }
                .background(Color.black)
                .onTapGesture {
                    hideKeyboard()
                }
                
                
            }
        }
    }
    
}

#Preview {
    ContentView()
        
}
