//
//  LabelCell.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit
import SnapKit

final class LabelTableViewCell: DefaultTableViewCell {

    // MARK: - UIElements

    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()

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
        addSubview(rightLabel)
    }

    private func setupLayout() {
        rightLabel.snp.makeConstraints {
            $0.centerY.equalTo(settingLabel)
            $0.trailing.equalToSuperview().offset(-35)
        }
    }

    // MARK: - Configuration

    override func configuration(data: SettingCell?) {
        super.configuration(data: data!)
        rightLabel.text = data?.additionalLabel
    }
}
