//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Yusup Aliskantiev on 06.01.2023.
//

import UIKit

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    public var episodes: [String] {
        character.episode
    }
    
    enum SectionType {
        case photo(viewModel: RMCharacterPhotoCellViewModel)
        case information(viewModels: [RMCharacterInfoCellViewModel])
        case episodes(viewModels: [RMCharacterEpisodeCellViewModel])
    }
    public var sections: [SectionType] = []
    
    
    // MARK: - Init
    init(character: RMCharacter){
        self.character = character
        setUpSection()
    }
    
    private func setUpSection(){
        sections = [
            .photo (viewModel: .init(imageURL: URL(string: character.image))),
            .information (viewModels: [
                .init(type: .status , value: character.status.text),
                .init(type: .gender , value: character.gender.rawValue),
                .init(type: .type , value: character.type),
                .init(type: .species , value: character.species),
                .init(type: .origin , value: character.origin.name),
                .init(type: .location , value: character.location.name),
                .init(type: .created , value: character.created),
                .init(type: .episodeCount , value: "\(character.episode.count)"),
            ]),
            .episodes (viewModels: character.episode.compactMap ({
                return RMCharacterEpisodeCellViewModel(episodeDataURL: URL(string:$0))
            }))
        ]
    }
    
    private var requestURL: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
    // MARK: - Layout
    
    public func createPhotoSectionLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createInfoSectionLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(150)), subitems: [item, item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createEpisodeSectionLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .absolute(150)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
}
