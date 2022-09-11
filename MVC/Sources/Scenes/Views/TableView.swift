//
//  TableView.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit
import SnapKit

class TableView: UIView {

    // MARK: - UIElements

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "DefaultTableViewCell")
//        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: "LabelTableViewCell")
//        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "SwitchTableViewCell")
//        tableView.register(NotifyImageTableViewCell.self, forCellReuseIdentifier: "NotifyImageTableViewCell")
//        tableView.dataSource = self
//        tableView.delegate = self
        return tableView
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
//        contents = ContentSections.contentSections
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

extension TableView: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return ContentSections.contentSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContentSections.contentSections[section].settingCellItem.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
