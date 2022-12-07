//
//  FooterCollectionView.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 06.12.2022.
//
import UIKit

final class FooterCollectionView: UICollectionReusableView  {

    static let identifire = "\(FooterCollectionView.self)"

    var didResumeButtonTapped: (() -> Void)?

    lazy var resumeButton: UIButton = {
        let button = UIButton(title: "Продолжить",
                              backgroundCollor: .white,
                              titleColor: .black,
                              cornerRadius: heightButton / 2,
                              font: .sfPro18Bold())
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let heightButton: CGFloat = 80

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didTappedButton() {
        didResumeButtonTapped?()
    }

    private func setupHeaderViews()   {
        addSubview(resumeButton)

        NSLayoutConstraint.activate([
            resumeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 20),
            resumeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resumeButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            resumeButton.heightAnchor.constraint(equalToConstant: heightButton)
        ])

    }

}
