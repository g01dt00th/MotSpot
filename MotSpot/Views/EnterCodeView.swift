//
//  EnterCodeView.swift
//  MotSpot
//
//  Created by Siarhei Dubko on 13.07.21.
//

import SwiftUI

struct EnterCodeView: View {
    
    @State var user = ""
    
    var body: some View {
        
        Color.white
            .ignoresSafeArea()
            .overlay(
                
                VStack(spacing: 10) {
                    
                    Image("Icon-2")
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                    
                    Text("Enter a code")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Please enter the code you received by email")
                        .fontWeight(.light)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                    
                    VStack(spacing: 10) {
                        HStack {
                            
                            TextField("Code", text: $user)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 8) {
                            
                            Text("Don’t receive a code? ")
                                .foregroundColor(Color.gray)
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Resend again")
                                    .underline()
                                    .foregroundColor(.orange)
                            })
                        }
                        
                        VStack {
                            
                            Button(action: {
                                
                            }) {
                                
                                Text("Reset the password")
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
            .offset(y: -120)
    }
}


struct EnterCodeView_Previews: PreviewProvider {
    static var previews: some View {
        EnterCodeView()
    }
}
