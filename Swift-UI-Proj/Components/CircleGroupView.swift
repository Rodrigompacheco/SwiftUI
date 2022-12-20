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
    
    var body: some View {
        Circle()
            .stroke(color.opacity(shapeOpacity), lineWidth: 40)
            .frame(width: 280, height: 280, alignment: .center)
        
        Circle()
            .stroke(color.opacity(shapeOpacity), lineWidth: 80)
            .frame(width: 280, height: 280, alignment: .center)
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(color: .white, shapeOpacity: 0.2)
        }
    }
}
