//
//  PoppinViewModel.swift
//  PartyExplorer
//
//  Created by Vineeth Kanaparthi on 12/1/23.
//

import Foundation
import Combine

class PoppinViewModel: ObservableObject {
    @Published private var parties: [Party] = []
    @Published private(set) var filteredParties: [Party] = []
    @Published var searchQuery: String = ""
    private var cancellables = Set<AnyCancellable>()
    let partyGenerator = PartyGenerator()
    
    init() {
        for _ in 0 ..< 3 {
            addParty()
        }
        setupFilter()
    }
    
    func setupFilter(){
        $searchQuery
            .removeDuplicates()
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink{ [weak self] searchText in
                self?.filterParties()
            }
            .store(in: &cancellables)
    }
    
    func filterParties(){
        self.filteredParties = self.searchQuery.isEmpty ? self.parties : self.parties.filter {
            $0.name.lowercased().contains(self.searchQuery.lowercased())
        }
    }

    func addParty() {
        parties.append(partyGenerator.generateParty())
        filterParties()
    }
}

class PartyGenerator {
    let partyInfo: [[String]] = [
        ["Birthday Party", "https://images.unsplash.com/photo-1602631985686-1bb0e6a8696e"],
        ["New Year's Eve Bash", "https://images.unsplash.com/photo-1535379665706-aea78de84a41"],
        ["Summer Beach Party", "https://images.unsplash.com/photo-1516370873344-fb7c61054fa9"],
        ["Tech Meetup", "https://images.unsplash.com/photo-1556761175-5973dc0f32e7"],
        ["Wedding", "https://images.unsplash.com/photo-1520854221256-17451cc331bf"],
        ["Music Festival", "https://images.unsplash.com/photo-1582711012124-a56cf82307a0"],
        ["Art Exhibition", "https://images.unsplash.com/photo-1459908676235-d5f02a50184b"],
        ["Pool Party", "https://images.unsplash.com/photo-1466378284817-a6b7fd50cc68"],
        ["Mountain Retreat", "https://images.unsplash.com/photo-1610344264630-e77bc4bf5983"],
        ["Gourmet Dinner Night", "https://images.unsplash.com/photo-1519671282429-b44660ead0a7"],
        ["Halloween Costume Party", "https://images.unsplash.com/photo-1509557965875-b88c97052f0e"],
        ["Jazz Night", "https://images.unsplash.com/photo-1534198469756-b4f4586e5e9c"],
        ["Book Club Meeting", "https://images.unsplash.com/photo-1457276587196-a9d53d84c58b"],
        ["Yoga Retreat", "https://images.unsplash.com/photo-1545205597-3d9d02c29597"],
        ["Winter Wonderland Party", "https://images.unsplash.com/photo-1529973625058-a665431328fb"],
        ["Gaming Tournament", "https://images.unsplash.com/photo-1542751371-adc38448a05e"],
        ["Vintage Car Show", "https://images.unsplash.com/photo-1533922598206-a1a2594e5873"]
    ]

    
    func generateParty() -> Party {
        if let randomParty = partyInfo.randomElement() {
            return Party(
                name: randomParty[0],
                bannerImage: URL(string: randomParty[1])!)
        } else {
            return Party(
                name: partyInfo[0][0],
                bannerImage: URL(string: partyInfo[0][1])!)
        }
        
    }
}
