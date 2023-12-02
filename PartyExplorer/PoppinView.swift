//
//  ContentView.swift
//  PartyExplorer
//
//  Created by Vineeth Kanaparthi on 12/1/23.
//

import SwiftUI

struct PoppinView: View {
    
    @StateObject private var poppinViewModel = PoppinViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    VStack{
                        ForEach(poppinViewModel.filteredParties){ party in
                            PartyViewCard(party: party)
                        }
                    }.padding()
                }.background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(UIColor.systemBackground).opacity(0.5), Color(UIColor.purple)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .searchable(text: $poppinViewModel.searchQuery)
                .navigationTitle("Discover Parties")
                addButton
            }
            
        }
        
        
    }
    
    private var addButton: some View {
        Button(action: {
            poppinViewModel.addParty()
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(UIColor.systemBackground))
                Text("Add Party")
                    .fontWeight(.bold)
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(Color(UIColor.systemBackground))
            .cornerRadius(10)
        }
    }
}

#Preview {
    PoppinView()
}
