//
//  SwitchCell.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit
import SnapKit

final class SwitchTableViewCell: DefaultTableViewCell {
    
    // MARK: - UIElements
    
    private lazy var mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = false
        mySwitch.addTarget(self, action: #selector(tapSwitch), for: .valueChanged)
        return mySwitch
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
        contentView.addSubview(mySwitch)
    }
    
    private func setupLayout() {
        mySwitch.snp.makeConstraints {
            $0.centerY.equalTo(settingLabel)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Actions
    
    @objc func tapSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("Включен")
        } else {
            print("Выключен")
        }
    }
}
