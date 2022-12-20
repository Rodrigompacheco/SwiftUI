//
//  HomeView.swift
//  Swift-UI-Proj
//
//  Created by Rodrigo Pacheco on 13/12/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        VStack {
            // MARK: - CENTER
            Spacer()
            ZStack {
                CircleGroupView(color: .gray, shapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
            }

            Spacer()
            
            Text("""
                 The time that leads to mastery is
                 dependent the intensityof our focus.
                """)
            .font(.system(size: 20))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            
            Spacer()
            
            // MARK: - FOOTER
            Button(action: {
                isOnboardingViewActive = false
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                    
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
