//
//  DefaultCell.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit
import SnapKit


class DefaultTableViewCell: UITableViewCell {

    var contents: SettingCell? {
        didSet {
            iconImage.image = contents?.icon
            settingLabel.text = contents?.settingLabel
            backIconImage.backgroundColor = contents?.backgroundcolorIcon
        }
    }

    // MARK: - Outlets

    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        return imageView
    } ()

    lazy var backIconImage: UIView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        return view
    } ()

    lazy var settingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    } ()

    // MARK: - Initialisers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(backIconImage)
        addSubview(iconImage)
        addSubview(settingLabel)
    }

    func configure(data: SettingCell?) {
        iconImage.image = data?.icon
    }

    private func setupLayout() {
        backIconImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(35)
        }

        iconImage.snp.makeConstraints {
            $0.centerX.centerY.equalTo(backIconImage)
            $0.size.equalTo(backIconImage).inset(4)
        }

        settingLabel.snp.makeConstraints {
            $0.centerY.equalTo(backIconImage)
            $0.leading.equalTo(backIconImage.snp.trailing).offset(20)
        }
    }
}
