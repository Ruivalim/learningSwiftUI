//
//  Animation01.swift
//  learningSwiftUI
//
//  Created by Rui Valim on 17/04/22.
//

import SwiftUI

struct Animation01: View {
    @State var open = false
    @State var label = "Open"
    
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees( open ? 30 : 0 ))
                    .offset(y: open ? -500 : 0)
                    .opacity(open ? 0 : 1)
                    
                Rectangle()
                    .foregroundColor(.green)
                    .ignoresSafeArea(.all)
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees( open ? 30 : 0 ))
                    .offset(y: open ? 500 : 0)
                    .opacity(open ? 0 : 1)
            }
            
            Button(label) {
                withAnimation{
                    runOpen()
                }
            }
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(8)
        }
    }
    
    func runOpen(){
        self.label = self.open ? "Open" : "Close"
        self.open.toggle()
    }
}

struct Animation01_Previews: PreviewProvider {
    static var previews: some View {
        Animation01()
    }
}
