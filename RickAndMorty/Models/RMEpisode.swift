//
//  RMEpisode.swift
//  RickAndMorthy
//
//  Created by Yusup Aliskantiev on 30.12.2022.
//

import Foundation

struct RMEpisode: Codable {
         let id: Int
         let name: String
         let air_date: String
         let episode: String
         let characters: [String]
         let url: String
         let created: String
}
