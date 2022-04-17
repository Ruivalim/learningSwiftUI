//
//  MainPage.swift
//  learningSwiftUI
//
//  Created by Rui Valim on 17/04/22.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: Animation01()) {
                    Text("Animation 01")
                }
            }
            .navigationTitle("Learning SwiftUI")
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
