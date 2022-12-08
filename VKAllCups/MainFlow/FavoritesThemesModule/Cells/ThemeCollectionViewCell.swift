//
//  ThemeCollectionViewCell.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 04.12.2022.
//

import UIKit

final class ThemeCollectionViewCell: UICollectionViewCell {
    
    static let idenifire = "\(ThemeCollectionViewCell.self)"

    var didThemeTapped: (() -> Void)?

    //MARK: - Переопределяем isSelected чтоб вызывался updateTheme после каждого выделения ячейки
    override var isSelected: Bool {
        didSet {
            updateTheme()
            didThemeTapped?()
        }
    }

    override var isHighlighted: Bool {
        didSet { bounce(isHighlighted) }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var mainContainer = UIView()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .sfPro16Bold()
        label.textColor = .themeTitleColor
        return label
    }()
    
    private lazy var statusImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.image = UIImage(named: "plus")
        return image
    }()
    
    private lazy var devider: UIView = {
        let view = UIView()
        view.backgroundColor = .deviderColor
        return view
    }()
    
    private func configureCell() {
        mainContainer.clipsToBounds = true
        mainContainer.layer.cornerRadius = 12
        mainContainer.backgroundColor = .themeCellColor
        
        makeConstraint()
        updateTheme()
    }
    
    private func makeConstraint() {
        
        contentView.addSubview(mainContainer)
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        mainContainer.addSubview(statusImageView)
        statusImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            statusImageView.rightAnchor.constraint(equalTo: mainContainer.rightAnchor, constant: -8),
            statusImageView.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
            statusImageView.widthAnchor.constraint(equalToConstant: 24),
            statusImageView.heightAnchor.constraint(equalToConstant: 24)
        ])

        mainContainer.addSubview(devider)
        devider.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            devider.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
            devider.rightAnchor.constraint(equalTo: statusImageView.leftAnchor, constant: -8),
            devider.heightAnchor.constraint(equalTo: statusImageView.heightAnchor),
            devider.widthAnchor.constraint(equalToConstant: 1)

        ])

        mainContainer.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelTitle.leftAnchor.constraint(equalTo: mainContainer.leftAnchor, constant: 8),
            labelTitle.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
            labelTitle.rightAnchor.constraint(equalTo: devider.leftAnchor, constant: -8)
        ])
    }
    
    private func updateTheme() {
       
        UIView.animate(withDuration: 0.4) {
            self.mainContainer.backgroundColor = self.isSelected ? .themeCellColorIsSelected : .themeCellColor
            self.statusImageView.image = self.isSelected ? UIImage(named: "check") : UIImage(named: "plus")
            self.devider.isHidden = self.isSelected
        }
    }

    private func bounce(_ bounce: Bool) {
        UIView.animate(
            withDuration: 0.8,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.8,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: { self.transform = bounce ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity },
            completion: nil)
    }
    
    func configure(model: Theme) {
        if model.isFavorite ?? false {
            statusImageView.image = UIImage(named: "check")
        } else {
            statusImageView.image = UIImage(named: "plus")
        }
        labelTitle.text = model.themeName
    }
    
}
