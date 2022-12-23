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
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            // MARK: - CENTER
            Spacer()
            ZStack {
                CircleGroupView(color: .gray,
                                shapeOpacity: 0.1,
                                withAnimation: true)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimating ? 20 : -20)
                    .animation(
                        Animation
                            .easeInOut(duration: 1.5)
                            .repeatForever()
                        , value: isAnimating
                    )
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
                withAnimation() {
                    isOnboardingViewActive = true
                }
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
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
