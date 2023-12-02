//
//  Party.swift
//  PartyExplorer
//
//  Created by Vineeth Kanaparthi on 12/1/23.
//

import Foundation


struct Party: Identifiable {
    let id = UUID()
    let name: String
    let bannerImage: URL
    let price: Double
    let startDate: Date
    let endDate: Date?
    
    init(name: String, bannerImage: URL) {
        self.name = name
        self.bannerImage = bannerImage
        self.price = Double.random(in: 10.0 ... 20000.0)
        self.startDate = Party.randomDate(in: Date()...Date().addingTimeInterval(60 * 60 * 24 * 180))  // 6 months interval
        self.endDate = Bool.random() ? Party.randomDate(in: startDate...startDate.addingTimeInterval(60 * 60 * 24 * 180)) : nil
    }

    private static func randomDate(in range: ClosedRange<Date>) -> Date {
        let randomTimeInterval = TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate)
        return Date(timeIntervalSinceReferenceDate: randomTimeInterval)
    }
}
