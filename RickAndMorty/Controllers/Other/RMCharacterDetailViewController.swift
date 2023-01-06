//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Yusup Aliskantiev on 06.01.2023.
//

import UIKit


/// Controller to show ihfo about single character
final class RMCharacterDetailViewController: UIViewController {

   private let viweModel: RMCharacterDetailViewViewModel
    
    init(viweModel: RMCharacterDetailViewViewModel) {
        self.viweModel = viweModel
        super.init(nibName: nil, bundle: nil)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viweModel.title  
    }
    

}
