//
//  ViewController.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {
    
    private var tableView: TableView? {
        guard isViewLoaded else { return nil }
        return view as? TableView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        view = TableView()
        tableView?.tableView.dataSource = self
        tableView?.tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ContentSections.contentSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContentSections.contentSections[section].settingCellItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let content = ContentSections.contentSections[indexPath.section].settingCellItem[indexPath.row]
        
        switch content.typeCell {
        case .defaultCell:
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "DefaultTableViewCell", for: indexPath) as? DefaultTableViewCell
            defaultCell?.configuration(data: content)
            defaultCell?.accessoryType = .disclosureIndicator
            return defaultCell ?? UITableViewCell()
        case .labelCell:
            let labelCell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as? LabelTableViewCell
            labelCell?.configuration(data: content)
            labelCell?.accessoryType = .disclosureIndicator
            return labelCell ?? UITableViewCell()
        case .switchCell:
            let switchCell = tableView.dequeueReusableCell(withIdentifier: "SwitchTableViewCell", for: indexPath) as? SwitchTableViewCell
            switchCell?.configuration(data: content)
            switchCell?.selectionStyle = .none
            return switchCell ?? UITableViewCell()
        case .imageCell:
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "NotifyImageTableViewCell", for: indexPath) as? NotifyImageTableViewCell
            imageCell?.configuration(data: content)
            imageCell?.accessoryType = .disclosureIndicator
            return imageCell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ContentSections.contentSections[indexPath.section].settingCellItem[indexPath.row].typeCell != .switchCell {
            let viewController = DetailViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            viewController.contents = ContentSections.contentSections[indexPath.section].settingCellItem[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
            print("\(viewController.contents?.settingLabel ?? "")")
        }
    }
}
