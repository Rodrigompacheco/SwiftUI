//
//  OnboardingView.swift
//  Swift-UI-Proj
//
//  Created by Rodrigo Pacheco on 15/12/22.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: PROPERTY
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color("MainColor")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                // MARK: - HEADER
                Text("Donate")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
         
                // MARK: - CENTER
                ZStack {
                    CircleGroupView(color: .white, shapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
               
                // MARK: - FOOTER
                ZStack {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                       
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    HStack {
                        Capsule()
                            .fill(Color("BlueColor"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("BlueColor"))
                                
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .frame(width: 80)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && gesture.translation.width <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ gesture in
                                    if gesture.translation.width < buttonWidth - 80 {
                                        buttonOffset = 0
                                    }
                                })
                        )
                        
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
            }
            .padding(.top, 60)
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
