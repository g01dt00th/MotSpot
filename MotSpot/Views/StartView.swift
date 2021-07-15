//
//  StartView.swift
//  MotSpot
//
//  Created by Siarhei Dubko on 13.07.21.
//

import SwiftUI

struct StartView: View {
    
    @State var userName = ""
    @State var email = ""
    @State var pass = ""
    @State var passAgain = ""
    @State var countryId = ""
    @State var city = ""
    
    var body: some View {
        
        Color.white
            .ignoresSafeArea()
            .overlay(
                
                VStack(spacing: 10) {
                    
                    Image("Icon-2")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                    
                    Text("Let's Get Started")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Sign in to continue")
                        .fontWeight(.light)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                    
                    VStack(spacing: 5) {
                        HStack {
                            
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .padding()
                            
                            TextField("Nickname", text: $userName)
                                .padding()
                                .foregroundColor(.black)
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .padding()
                            
                            TextField("Your Email", text: $email)
                                .foregroundColor(.black)
                                .padding()
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                                .padding()
                            
                            SecureField("Password", text: $pass)
                                .foregroundColor(.black)
                                .padding()
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                                .padding()
                            
                            SecureField("Password again", text: $passAgain)
                                .foregroundColor(.black)
                                .padding()
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.gray)
                                .padding()
                            
                            TextField("Country", text: $countryId)
                                .foregroundColor(.black)
                                .padding()
                            
                            Image(systemName: "arrow.down")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        HStack {
                            Image(systemName: "house")
                                .foregroundColor(.gray)
                                .padding()
                            
                            TextField("Town", text: $city)
                                .foregroundColor(.black)
                                .padding()
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                    }
                    
                    HStack {
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width - 90)
                                .padding()
                            
                        }
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding()
                        
                    }
                })
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
