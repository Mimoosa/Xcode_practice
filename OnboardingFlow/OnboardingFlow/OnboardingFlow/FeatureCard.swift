//
//  FeatureCard.swift
//  OnboardingFlow
//
//  Created by Monami Kirjavainen on 20.3.2026.
//

import SwiftUI

struct FeatureCard: View {
    let iconName: String
    let description: String
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
                .foregroundStyle(.white)
            
            Text(description)
                .foregroundStyle(.white)
            
            Spacer()
                
                }
        .padding()
        .background{ RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
                .opacity(0.25)
            .brightness(-0.4)}
    }
}

#Preview {
    FeatureCard(iconName:"person.2.crop.square.stack.fill",
                description: "A multiline description about a feature paired with the image on the left.")
}
