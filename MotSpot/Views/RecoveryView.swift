//
//  RecoveryView.swift
//  MotSpot
//
//  Created by Siarhei Dubko on 13.07.21.
//

import SwiftUI

struct RecoveryView: View {
    
    @State var user = ""
    
    var body: some View {
        
        Color.white
            .ignoresSafeArea()
            .overlay(
                
                VStack(spacing: 10) {
                    
                    Image("Icon-2")
                        .resizable()
                        .frame(width: 130, height: 130, alignment: .center)
                    
                    Text("Password recovery")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Enter your email or nickname")
                        .fontWeight(.light)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                    
                    VStack(spacing: 10) {
                        HStack {
                            
                            TextField("Your email or nickname", text: $user)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color(.gray), lineWidth: 1))
                        .padding(.horizontal, 20)
                        
                        VStack {
                            
                            Button(action: {
                                
                            }) {
                                
                                Text("Send")
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
            .offset(y: -150)
    }
}


struct RecoveryView_Previews: PreviewProvider {
    static var previews: some View {
        RecoveryView()
    }
}
