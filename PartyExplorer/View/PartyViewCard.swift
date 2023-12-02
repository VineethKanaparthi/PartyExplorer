//
//  PartyViewCard.swift
//  PartyExplorer
//
//  Created by Vineeth Kanaparthi on 12/1/23.
//

import SwiftUI

struct PartyViewCard: View {
    var party: Party
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Group{
                Text(party.name)
                    .font(.headline)
                    .padding(.top, 5)
                PartyBannerView(url: party.bannerImage, imageHeight: 150)
                HStack {
                    fromAndToDateView
                    Spacer()
                    priceView
                }
            }
            .foregroundColor(colorScheme == .dark ? .white : .black)
            
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(UIColor.systemBackground).opacity(0.5), Color(.purple)]),
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )
        )
        .cornerRadius(10)
        .shadow(radius: 4)
    }
    
    private var fromAndToDateView: some View {
        Group{
            Image(systemName: "calendar")
            Text("\(formattedDate(party.startDate))")
                .font(.subheadline)
            
            if let endDate = party.endDate {
                Text(" - ")
                    .font(.subheadline)
                Image(systemName: "calendar")
                Text("\(formattedDate(endDate))")
                    .font(.subheadline)
            }
        }
    }
    
    private var priceView: some View {
        Group{
            Image(systemName: "tag")
            Text(" $\(String(format: "%.1f", party.price))")
                .font(.subheadline)
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
