//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by Monami Kirjavainen on 20.3.2026.
//

import SwiftUI


struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
                
            Text("Welcome to My App")
                .font(.title)
                .fontWeight(.semibold)
                .fontWidth(.condensed)
                .fontDesign(.monospaced)
                .padding(.top)
            
            Text("Description text goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                .font(.title2)
                .multilineTextAlignment(.center)
        }
      .padding()
     
    }
}


#Preview {
    WelcomePage()
}
      
