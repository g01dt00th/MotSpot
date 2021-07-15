//
//  NewPasswordView.swift
//  MotSpot
//
//  Created by Siarhei Dubko on 13.07.21.
//

import SwiftUI

struct NewPasswordView: View {
    
    @State var pass = ""
    @State var newPass = ""
    
    var body: some View {
        
        Color.white
            .ignoresSafeArea()
            .overlay(
                
                VStack(spacing: 10) {
                    
                    Image("Icon-2")
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                    
                    Text("Enter a new password")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Please come up with a new password")
                        .fontWeight(.light)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                    
                    VStack(spacing: 10) {
                        HStack {
                            
                            TextField("Password", text: $pass)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        HStack {
                            
                            TextField("Password again", text: $newPass)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        VStack {
                            
                            Button(action: {
                                
                            }) {
                                
                                Text("Set a new password")
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width - 90)
                                    .padding()
                            }
                            .background(Color.orange)
                            .cornerRadius(10)
                            .padding()
                        }
                    }
                })
            .offset(y: -100)
    }
}


struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
