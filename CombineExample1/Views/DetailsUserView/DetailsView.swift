//
//  DetailsView.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 31.05.2022.
//

import SwiftUI
//@MainActor
struct DetailsView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    let user: UserCellModel
    
    var body: some View {
        
        contentView
            .onAppear {
                
                userViewModel.getUser(user.name)
//                userViewModel.asyncGetUser(user.name)
            }
            .navigationBarTitle("User information", displayMode: .automatic)
    }
    
    private var contentView: some View {
        
        VStack {
            
            avatarView()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(
                    color: .blue
                    .opacity(0.5), radius: 10, x: 0, y: 0
                )
            
            Text(user.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            
            Spacer()
            
            informationView
            
        }
    }
    
    private func avatarView() -> some View {
        
        AsyncImage(url: user.avatarURL) { image in
            
            image
                .resizable()
                .overlay(Circle().stroke(.blue, lineWidth: 6))
            
        } placeholder: {
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                
            
        }
    }
    
    private var informationView: some View {
        
        Form {
            
            rowInformation("Full name:", with: userViewModel.detailsUser.fullName)

            rowInformation("Location:", with: userViewModel.detailsUser.location)

            rowInformation("Repositories:", with: String(userViewModel.detailsUser.repoCount))

            rowInformation("Followers:", with: String(userViewModel.detailsUser.followers))
            
            linkView
                
        }
        
    }
    
    private func rowInformation(_ title: String,
                                with description: String) -> some View {
        
        HStack {
            
            Text(title)
                .fontWeight(.medium)
                .foregroundColor(.blue)
                .opacity(0.7)
            
            Spacer()
            
            Text(description)
                .fontWeight(.medium)
                .foregroundColor(.blue)
            
        }
    }
    
    private var linkView: some View {
        
        Group {
            
            if let url = userViewModel.detailsUser.profileURL {
                
                Link(destination: url) {
                    
                    Text("Open URL repository")
                }
            }
        }
        
    }
}

struct NavBar_ZStack: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                // NavigationView Background
                VStack {
                    RadialGradient(colors: [.green.opacity(0.3), .blue.opacity(0.5)],
                                   center: .bottomTrailing,
                                   startRadius: 0, endRadius: 300)
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 0)
                    
                    Spacer()
                }
                
                VStack {
                    Text("Use a ZStack to put a background behind the Nav view.")
                        .padding()
                    Spacer()
                }
                .navigationTitle("Nav Bar Background")
                .font(.title2)
            }
        }
    }
}
struct DetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let emptyURL = URL(string: "")
        
        let user = UserCellModel(id: 000,
                             name: "Scooter",
                             avatarURL: emptyURL)
        
        DetailsView(user: user)
    }
}
