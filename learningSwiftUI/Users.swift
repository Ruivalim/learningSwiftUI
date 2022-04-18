//
//  Users.swift
//  learningSwiftUI
//
//  Created by Rui Valim on 17/04/22.
//

import SwiftUI

struct Users: View {
    @State var userList = [User]()
    @State var loading = true;
    
    var body: some View {
        ZStack{
            ZStack {
                LoaderView()
            }.hidden(!loading)
            
            ZStack {
                VStack{
                    List(userList, id: \.id) { user in
                        UserRow(user: user)
                   }
                }
            }.hidden(loading)
        }.onAppear(perform: loadUsers).navigationTitle("User List")
    }
    
    
    func loadUsers () {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Invalid URL")
            return
        }
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request){ data, response, error in
                if let error = error {
                        print("Error getting data", error)
                }
                
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode != 200 {
                    print("Error getting data: \(response.statusCode)")
                    return
                }
                
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode([User].self, from: data)
                        DispatchQueue.main.async {
                            self.loading = false
                            self.userList = response
                        }
                        return
                    } catch let error {
                        print("Error decoding \(error)")
                    }
                }
            }.resume()
    }
}

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        Users()
    }
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

struct UserRow: View {
    var user: User;
    
    var body: some View {
        HStack{
            AsyncImage(
                url: URL(string: user.avatar)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 45, height: 45)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            
            Text(user.name)
        }
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
            case true: self.hidden()
            case false: self
        }
    }
}
