//
//  DetailViewController.swift
//  MVC
//
//  Created by Артем Галай on 11.09.22.
//

import UIKit

final class DetailViewController: UIViewController {

    var contents: SettingCell?

    private var detailView: DetailView? {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }

    override func loadView() {
        view = DetailView()
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = DetailView()
        configureView()
    }

    func configureView() {
        guard let models = contents else { return }
        detailView?.configuration(data: models)
    }
}
