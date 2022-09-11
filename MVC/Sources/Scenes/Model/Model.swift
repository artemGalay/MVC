//
//  File.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit

enum TypeCell {
    case defaultCell
    case labelCell
    case switchCell
    case imageCell
}

struct SettingCell: Hashable {
    var icon: UIImage
    var backgroundcolorIcon: UIColor
    var settingLabel: String
    var additionalLabel: String?
    var settingSwitch: Bool?
    var notifyIcon: UIImage?
    var typeCell: TypeCell
}

struct ContentSections {
    var settingCellItem: [SettingCell]
}

extension ContentSections {
    static var contentSections: [ContentSections] = [
        ContentSections(settingCellItem:
                            [SettingCell(icon: UIImage(systemName: "airplane")!,
                                         backgroundcolorIcon: .systemOrange,
                                         settingLabel: "Авиарежим",
                                         settingSwitch: true,
                                         typeCell: .switchCell),
                             SettingCell(icon: UIImage(systemName: "wifi")!,
                                         backgroundcolorIcon: .systemBlue,
                                         settingLabel: "Wi-fi",
                                         additionalLabel: "Не подключено",
                                         typeCell: .labelCell),
                             SettingCell(icon: UIImage(named: "bluetooth")!,
                                         backgroundcolorIcon: .systemBlue,
                                         settingLabel: "Bluetooth",
                                         additionalLabel: "Вкл.",
                                         typeCell: .labelCell),
                             SettingCell(icon: UIImage(systemName: "antenna.radiowaves.left.and.right")!,
                                         backgroundcolorIcon: .systemGreen,
                                         settingLabel: "Сотовая связь",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(systemName: "personalhotspot")!,
                                         backgroundcolorIcon: .systemGreen,
                                         settingLabel: "Режим модема",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(named: "vpn")!,
                                         backgroundcolorIcon: .systemBlue,
                                         settingLabel: "VPN",
                                         settingSwitch: true,
                                         typeCell: .switchCell)]),

        ContentSections(settingCellItem:
                            [SettingCell(icon: UIImage(systemName: "bell.badge.fill")!,
                                          backgroundcolorIcon: .systemRed,
                                          settingLabel: "Уведомления",
                                          typeCell: .defaultCell),
                              SettingCell(icon: UIImage(systemName: "speaker.wave.3.fill")!,
                                          backgroundcolorIcon: .systemRed,
                                          settingLabel: "Звуки, тактильные сигналы",
                                          typeCell: .defaultCell),
                              SettingCell(icon: UIImage(systemName: "moon.fill")!,
                                          backgroundcolorIcon: .systemIndigo,
                                          settingLabel: "Фокусирование",
                                          typeCell: .defaultCell),
                              SettingCell(icon: UIImage(systemName: "hourglass")!,
                                          backgroundcolorIcon: .systemIndigo,
                                          settingLabel: "Экранное время",
                                          typeCell: .defaultCell)]),

        ContentSections(settingCellItem:
                            [SettingCell(icon: UIImage(systemName: "gear")!,
                                         backgroundcolorIcon: .systemGray,
                                         settingLabel: "Основные",
                                         notifyIcon: UIImage(systemName: "1.circle.fill"),
                                         typeCell: .imageCell),
                            SettingCell(icon: UIImage(systemName: "switch.2")!,
                                         backgroundcolorIcon: .systemGray,
                                         settingLabel: "Пункт управления",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(systemName: "textformat.size")!,
                                         backgroundcolorIcon: .systemBlue,
                                         settingLabel: "Экран и яркость",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(named: "homescreen")!,
                                         backgroundcolorIcon: .blue,
                                         settingLabel: "Экран «Домой»",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(named: "accessibility")!,
                                         backgroundcolorIcon: .systemBlue,
                                         settingLabel: "Универсальный доступ",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(systemName: "circle.hexagongrid.circle")!,
                                         backgroundcolorIcon: .systemGray,
                                         settingLabel: "Обои",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(systemName: "globe.asia.australia.fill")!,
                                         backgroundcolorIcon: .systemRed,
                                         settingLabel: "Siri и Поиск",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(systemName: "faceid")!,
                                         backgroundcolorIcon: .systemGreen,
                                         settingLabel: "Face ID и код-пароль",
                                         typeCell: .defaultCell),
                             SettingCell(icon: UIImage(systemName: "hourglass")!,
                                         backgroundcolorIcon: .systemRed,
                                         settingLabel: "Экстренный вызов - SOS",
                                         typeCell: .defaultCell)]),
    ]
}

