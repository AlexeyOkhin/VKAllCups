//
//  FavoritesViewController.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    //MARK: - Private properties
    
    private let headerTitle = UILabel(
        name: "Отметьте то, что вам интересно, чтобы настроить Дзен",
        font: .sfPro16(weight: 0.2)
    )
    private let headerButton = UIButton(
        title: "Позже",
        backgroundCollor: .headerButtonColor,
        titleColor: .headerTitleButtonColor,
        cornerRadius: 20
    )
    
    private let collectionView = UICollectionView()
    
    private let themesDzen = Bundle.main.decode([Theme].self, from: "ThemesDzen.json")
    private var favoriteThemes = [Theme]()
    
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
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           
        ])
    }
}
