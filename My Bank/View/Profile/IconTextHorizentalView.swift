//
//  SwiftUIView.swift
//  My Bank
//
//  Created by Mousa on 24.06.21.
//

import SwiftUI

struct IconTextHorizentalView: View {
    
    var icon: String
    var text: String
    
    var body: some View {
        
        ZStack {
            Color(Assets.Colors.background)
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25, alignment: .center)
                        
                    Text(text)
                        .foregroundColor(.white)
                        .font(.bold(.title3)())
                        .padding(.leading, 8)
                }
                .padding(.all, 10)
            }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        IconTextHorizentalView(icon: "mousa", text: "Personal info")
    }
}
