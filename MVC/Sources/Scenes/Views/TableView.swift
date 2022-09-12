//
//  TableView.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit
import SnapKit

final class SettingsView: UIView {

    // MARK: - UIElements

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "DefaultTableViewCell")
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: "LabelTableViewCell")
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "SwitchTableViewCell")
        tableView.register(NotifyImageTableViewCell.self, forCellReuseIdentifier: "NotifyImageTableViewCell")
        return tableView
    }()

    // MARK: - Initialisers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarhy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarhy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.top.right.bottom.left.equalToSuperview()
        }
    }
}
