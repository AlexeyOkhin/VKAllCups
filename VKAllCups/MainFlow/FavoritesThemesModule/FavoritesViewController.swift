//
//  FavoritesViewController.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

final class FavoritesViewController: UIViewController {

    //MARK: - Private properties
    private var themesDzen = Bundle.main.decode([Theme].self, from: "ThemesDzen.json")

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

    private lazy var themesCollectionView: UICollectionView = {
        let layout = LeftAlignmentFlowLayout()
        layout.estimatedItemSize = LeftAlignmentFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.footerReferenceSize = CGSize(width: 100, height: 100)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.idenifire)
        collection.register(FooterCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionView.identifire)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.allowsMultipleSelection = true
        collection.showsVerticalScrollIndicator = false
        collection.alwaysBounceVertical = true
        collection.dataSource = self
        return collection
    }()

    //MARK: - Privaate Actions
    
    @objc private func nextAction() {
        //TODO: - Routing

    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
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
        return themesDzen.count > 15 ? 15 : themesDzen.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.idenifire,
                                                      for: indexPath) as? ThemeCollectionViewCell
        else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.idenifire,for: indexPath)
        }
        let theme = themesDzen[indexPath.row]
        cell.configure(model: theme)
        cell.didThemeTapped = {[weak self] in

            if self?.themesDzen[indexPath.row].isFavorite != nil {
                self?.themesDzen[indexPath.row].isFavorite?.toggle()
            } else {
                self?.themesDzen[indexPath.row].isFavorite = true
            }
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        guard let headerView = collectionView.dequeueReusableSupplementaryView(
          ofKind: UICollectionView.elementKindSectionFooter,
          withReuseIdentifier: FooterCollectionView.identifire,
          for: indexPath) as? FooterCollectionView
        else {
            return collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "\(FooterCollectionView.identifire)",
                for: indexPath)
        }

        headerView.didResumeButtonTapped = {
            //TODO: - add routing
            print(self.themesDzen.filter({ item in
                item.isFavorite == true
            }))
        }

        return headerView
    }

}
