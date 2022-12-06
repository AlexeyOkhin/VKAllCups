//
//  FavoritesViewController.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    //MARK: - Private properties
    
    private lazy var headerTitle = UILabel(
        name: "Отметьте то, что вам интересно, чтобы настроить Дзен",
        font: .sfPro16Reg()
    )
    private lazy var headerButton: UIButton = {
        let button = UIButton(
            title: "Позже",
            backgroundCollor: .headerButtonColor,
            titleColor: .headerTitleButtonColor,
            cornerRadius: 20
        )
        button.addTarget(self, action: #selector (nextAction), for: .touchUpInside)
        return button
    }()
   
    //MARK: - Создаем CollectionView для множественного выбора обязательно используем allowsMultipleSelection
    
    private lazy var themesCollectionView: UICollectionView = {
        let layout = LeftAlignmentFlowLayout()
        layout.estimatedItemSize = LeftAlignmentFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: "ThemeCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.allowsMultipleSelection = true
        collection.alwaysBounceVertical = true
        //collection.delegate = self
        collection.dataSource = self
        return collection
    }()

    private let themesDzen = Bundle.main.decode([Theme].self, from: "ThemesDzen.json")
    private var favoriteThemes = [Theme]()

    //MARK: - Privaate Actions
    
    @objc private func nextAction() {
        //TODO: - Next module

    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        print(themesDzen)
        
    }
   
}

    //MARK: - Private methods

private extension FavoritesViewController {
    func configureAppearance() {
        let header = HeaderView(label: headerTitle, button: headerButton)
        view.addSubview(header)

        let marginsView = self.view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: marginsView.topAnchor, constant: 16),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        self.view.addSubview(themesCollectionView)
        NSLayoutConstraint.activate([
            themesCollectionView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 24),
            themesCollectionView.bottomAnchor.constraint(equalTo: marginsView.bottomAnchor),
            themesCollectionView.leadingAnchor.constraint(equalTo: marginsView.leadingAnchor),
            themesCollectionView.trailingAnchor.constraint(equalTo: marginsView.trailingAnchor)
        ])
        
    }
}

//MARK: - Extension for CollectionView

extension FavoritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themesDzen.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ThemeCell",
            for: indexPath) as! ThemeCollectionViewCell
        let theme = themesDzen[indexPath.row]
        cell.configure(model: theme)
        
        return cell
    }

}

