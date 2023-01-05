//
//  RMCharacterViewController.swift
//  RickAndMorthy
//
//  Created by Yusup Aliskantiev on 30.12.2022.
//

import UIKit

/// Controller to show and search for Characters 
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
       title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
            URLQueryItem(name: "name", value: "rick"),
            URLQueryItem(name: "status", value: "alive")
            ]
        )
        
        print(request.url)
        
        RMServise.shared.execute(request, expecting: RMCharacter.self) { result in
            
        }
    }

}
