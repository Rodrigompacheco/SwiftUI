//
//  CircleGroupView.swift
//  Swift-UI-Proj
//
//  Created by Rodrigo Pacheco on 15/12/22.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var color: Color
    @State var shapeOpacity: Double
    @State var withAnimation: Bool
    @State private var isAnimating = false
    
    var body: some View {
        let circlesStack = ZStack {
            Circle()
                .stroke(color.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 280, height: 280, alignment: .center)
            
            Circle()
                .stroke(color.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 280, height: 280, alignment: .center)
        }
        
        if withAnimation {
            circlesStack.blur(radius: isAnimating ? 0 : 10)
            .opacity(isAnimating ? 1 : 0)
            .scaleEffect(isAnimating ? 1 : 0.5)
            .animation(.easeOut(duration: 2), value: isAnimating)
            .onAppear(perform: {
                isAnimating = true
            })
        } else {
            circlesStack
        }
       
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(color: .white, shapeOpacity: 0.2, withAnimation: true)
        }
    }
}
