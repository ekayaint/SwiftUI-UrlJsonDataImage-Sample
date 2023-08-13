//
//  DetailView.swift
//  SwiftUI-UrlJsonDataImage-Sample
//
//  Created by ekayaint on 12.08.2023.
//

import SwiftUI

struct DetailView: View {
    var user: JSONData
    @State var followers: [JSONData] = []
    @State var isEmpty = false
    
    var body: some View {
        VStack{
            if followers.isEmpty{
                
                Spacer()
                
                if isEmpty {
                    Text("No follower")
                        .fontWeight(.bold)
                } else {
                    Text("Loading")
                        .font(.title)
                        .fontWeight(.bold)
                    ProgressView()
                } //: if
                
                Spacer()
                
            } else {
                List {
                    Text("Followers")
                    ForEach(followers) { follower in
                        RowView(user: follower)
                    } //: ForEach
                } //: List
                .listStyle(InsetListStyle())
            } //: if
        } //: VStack
        .navigationTitle(user.login)
        .onAppear{
            getUserData(url: user.followers_url) { data in
                if data.isEmpty {
                    isEmpty = true
                } else {
                    followers = data
                }
            }
        } //: onAppear
    }
}

/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}*/
