//
//  RMCharacterPhotoCellViewModel.swift
//  RickAndMorty
//
//  Created by Yusup Aliskantiev on 09.06.2023.
//

import Foundation

final class RMCharacterPhotoCellViewModel {
    
    private let imageURL: URL?
    
    init (imageURL: URL?){
        self.imageURL = imageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageURL = imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageURL, completion: completion)
    }
}
