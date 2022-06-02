//
//  ContentView.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 31.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var userViewModel = UserViewModel()
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(userViewModel.users, id: \.id) { user in
                    
                    NavigationLink(destination:
                                    
                                    DetailsView(user: user)
                        .environmentObject(userViewModel)
                    ) {
                        
                        UserCell(user: user)
                    }
                    
                }
                
                LoaderView(isFailed: userViewModel.isRequestFailed)
                    .onAppear(perform: self.fetchAllUsersData)
                    .onTapGesture(perform: onTapLoadView)
                
            }
            .navigationTitle("GitHub Users:")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .foregroundColor(.blue)
    }
    
    private func onTapLoadView() {
        
        if userViewModel.isRequestFailed {
            
            userViewModel.isRequestFailed = false
            fetchAllUsersData()
        }
    }
    
    private func fetchAllUsersData() {
        
        userViewModel.getAllUsers()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
