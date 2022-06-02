//
//  UserCell.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 31.05.2022.
//

import SwiftUI

struct UserCell: View {
    
    let user: UserCellModel
    
    var body: some View {
        
        HStack (spacing: 12) {
         
            ImageView()
            
            Text(user.name)
        }
        .padding(4)
    }
    
    private func ImageView() -> some View {

        AsyncImage(url: self.user.avatarURL) { image in
            
            image.resizable()
            
        } placeholder: {
            
            Image(systemName: "person.circle")
                .resizable()
        }
        .clipShape(Circle())
        .frame(width: 50, height: 50)

    }
}

struct UserRow_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let emptyURL = URL(string: "")
        
        let userModel = UserCellModel(id: 000,
                                  name: "John Deere",
                                  avatarURL: emptyURL)
        
        UserCell(user: userModel)
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName("UserCell")
    }
        
}

