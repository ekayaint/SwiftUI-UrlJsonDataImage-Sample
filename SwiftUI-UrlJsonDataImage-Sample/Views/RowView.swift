//
//  RowView.swift
//  SwiftUI-UrlJsonDataImage-Sample
//
//  Created by ekayaint on 12.08.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct RowView: View {
    var user: JSONData
    var body: some View {
        HStack{
           AnimatedImage(url: URL(string: user.avatar_url)!)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 5)
            
            Text(user.login)
                .fontWeight(.bold)
                .foregroundColor(.black)
        } //: HStack
        .padding(.vertical, 5)
    }
}

/*struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(user: JSONData(id: 0, login: "", avatar_url: "", followers_url: ""))
    }
}*/
