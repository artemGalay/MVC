//
//  ViewController.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    override func loadView() {
        view = SettingsView()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        settingsView?.tableView.dataSource = self
        settingsView?.tableView.delegate = self
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

    func universalCell2<T: UITableViewCell>(cell: T,
                                            accessoryType: UITableViewCell.AccessoryType,
                                            _ indexPath: IndexPath,
                                            _ tableView: UITableView) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as? T
        else { return UITableViewCell() as? T ?? cell }
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let content = ContentSections.contentSections[indexPath.section].settingCellItem[indexPath.row]
        
        switch content.typeCell {
        case .defaultCell:
            let cell = universalCell2(cell: DefaultTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
            cell.configuration(data: content)
            return cell

        case .labelCell:
            let cell = universalCell2(cell: LabelTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
            cell.configuration(data: content)
            return cell

        case .switchCell:
            let cell = universalCell2(cell: SwitchTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
            cell.configuration(data: content)
            return cell
        case .imageCell:
            let cell = universalCell2(cell: NotifyImageTableViewCell(), accessoryType: .disclosureIndicator, indexPath, tableView)
            cell.configuration(data: content)
            return cell
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
