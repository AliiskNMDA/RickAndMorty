//
//  RMEndPoint.swift
//  RickAndMorthy
//
//  Created by Yusup Aliskantiev on 03.01.2023.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndPoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get loation info
    case location
    /// Endpoint to get episode info
    case episode
}
