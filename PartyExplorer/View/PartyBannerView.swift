//
//  PartyBannerView.swift
//  PartyExplorer
//
//  Created by Vineeth Kanaparthi on 12/1/23.
//

import SwiftUI

/// A view for displaying a the image of the dessert/meal.
struct PartyBannerView: View {
    /// The URL of the image.
    let url: URL
    
    /// The desired height of the displayed image.
    let imageHeight: CGFloat
    
    var body: some View {
        VStack {
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image.applyCommonModifiers(imageHeight: imageHeight)
                } else if phase.error != nil {
                    Image("party_banner").applyCommonModifiers(imageHeight: imageHeight)
                } else {
                    ProgressView()
                        .accessibility(hidden: true)
                }
            }
            .accessibility(label: Text("Party Banner"))
        }
    }
}

extension Image {
    func applyCommonModifiers(imageHeight: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: imageHeight)
            .padding(.horizontal, 5)
            .cornerRadius(10)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .scaledToFit()
    }
}

