//
//  ContentView.swift
//  SwiftUI-UrlJsonDataImage-Sample
//
//  Created by ekayaint on 12.08.2023.
//

import SwiftUI
import SDWebImageSwiftUI

func getUserData(url: String, completion: @escaping ([JSONData]) -> ()) {
    let session = URLSession(configuration: .default)
    
    session.dataTask(with: URL(string: url)!) { data, _, error in
        if let err = error {
            print("Error : \(err.localizedDescription)")
            return
        }
        
        do{
            let users = try JSONDecoder().decode([JSONData].self, from: data!)
            completion(users)
        } catch{
            print("decoding error")
        } //: Catch
    } //: session
    .resume()
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Users")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Home : View{
    @State var users: [JSONData] = []
    var body: some View{
        VStack{
            if users.isEmpty {
                Spacer()
                Text("Loading users...")
                    .font(.title)
                    .fontWeight(.bold)
                ProgressView()
                Spacer()
            } else{
                List(users) {user in
                    NavigationLink(destination: DetailView(user: user)) {
                        RowView(user: user)
                    }
                    
                }
            }
            
        } //: VStack
        .navigationBarItems(trailing:
        Button(action: {
            users.removeAll()
            getUserData(url: "https://api.github.com/users") { data in
                users = data
            }
        })
                            {
            Image(systemName: "arrow.clockwise")
        }
        ) //: NavigationBarItems
        .onAppear{
            getUserData(url: "https://api.github.com/users") { data in
                users = data
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
