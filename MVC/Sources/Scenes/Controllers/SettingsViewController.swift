//
//  ViewController.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {

//    var model: ContentSections?

    /// Это вычисляемое свойство преобразует тип родительской view в OnboardingView
    /// Это делается чтобы мы в будущем могли из Controller'a обращаться к элементам View
    private var ableView: TableView? {
        guard isViewLoaded else { return nil }
        return view as? TableView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true

        /// Присваиваем значению View наш созданный класс OnboardingView()
        /// Можно это сделать в Main.storyboard, но я решил сделать так
        view = TableView()
//        model = ContentSections.contentSections

//        configureView()
    }
}

// MARK: - Configurations

//private extension SettingsViewController {
//    func configureView() {
//        guard let models = model?.createModels() else { return }
//        onboardingView?.configureView(with: models)
//    }


