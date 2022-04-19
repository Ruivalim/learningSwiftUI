//
//  UserDetails.swift
//  learningSwiftUI
//
//  Created by Rui Valim on 18/04/22.
//

import SwiftUI

struct UserDetails: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var user: User
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                UserPhotoArea()
                    .ignoresSafeArea()
                    .foregroundColor(.teal)
                    .frame(height: 250)
                
                Spacer()
            }.offset(y: -40)
            
            VStack(alignment: .center, spacing: 0) {
                AsyncImage(
                    url: URL(string: user.avatar)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                Text(user.name)
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Spacer()
            }.offset(y: -40)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                    HStack {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color(.white))
                    Text("User List")
                        .foregroundColor(Color(.white))
                    }
                })
            }
        }
    }
}

struct UserPhotoArea: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY), control: CGPoint(x: rect.midX, y:  rect.maxY + 30))
        path.closeSubpath()
        
        return path;
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetails(user: User(id: 1, name: "Rui Valim", username: "r.valim.junior@gmail.com", phone: "000000000", website: "ruivalim.com.br", address: User.Address( street: "value", suite: "value", city: "value", zipcode: "value" )))
        }
    }
}
