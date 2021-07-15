//
//  ContentView.swift
//  MotSpot
//
//  Created by Siarhei Dubko on 13.07.21.
//

import SwiftUI
//import Firebase
//import FirebaseAuth

struct ContentView: View {
    
    @State private var showStartView = false
    
    @State private var email: String = ""
    @State private var pass: String = ""
    @State private var message = ""
    @State private var alert = false
    @State private var show = false
    
    @StateObject private var manager = HttpAuth()
    
    var body: some View {
        Color.white
            .ignoresSafeArea()
            .overlay(
                
                VStack(spacing: 15) {
                    
                    Image("Icon-2")
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                    
                    Text("Welcome to MOTSPOT")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Sign in to continue")
                        .fontWeight(.light)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                    
                    VStack(spacing: 10) {
                        HStack {
                            
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .padding()
                            
                            TextField("Your Email", text: $email)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 1)
                                        .strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        HStack {
                            
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                                .padding()
                            
                            SecureField("Password", text: $pass)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 1)
                                        .strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Forgot Password?")
                    }
                    
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .offset(x: 95)
                    .padding(.vertical, -5)
                    
                    VStack {
                        
                        Button(action: {
                            self.manager.postAuth(email: self.email, pass: self.pass)
                        }) {
                            
                            Text("Sign In")
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width - 90)
                                .padding()
                            
                        }
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding()
                        
                        .alert(isPresented: $alert) {
                            Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                        }
                        
                        Text("——————   or login with   ——————")
                            .foregroundColor(Color.gray)
                            .background(Color.white)
                            .padding(10)
                        
                        HStack {
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("google")
                                    .renderingMode(.original)
                                    .padding(10)
                                    .background(LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                                                    .edgesIgnoringSafeArea(.all))
                                    .clipShape(Circle())
                                    .padding(1)
                                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                    .opacity(0.8)
                                    .clipShape(Circle())
                                    .padding(1)
                            }
                            
                        }
                        
                        HStack(spacing: 8){
                            
                            Text("Don't Have An Account ?")
                                .foregroundColor(Color.gray)
                            
                            Button(action: {
                                self.showStartView.toggle()
                            }, label: {
                                Text("Register")
                                    .underline()
                                    .foregroundColor(.orange)
                                
                            }) .sheet(isPresented: self.$showStartView, content: {
                                StartView()
                            })
                            
                        }
                        .padding()
                    }
                })
    }
}

//func signInWithEmail(email: String, pass: String, completion: @escaping (Bool, String) -> Void) {
//    Auth.auth().signIn(withEmail: email, password: pass) { (res, err) in
//        if err != nil {
//            completion(false, (err?.localizedDescription)!)
//            return
//        }
//        completion(true, (res?.user.email)!)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
