//
//  AppDetailVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/24/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var appDetailVersionView: AppDetailVersionView {
        return self.view as! AppDetailVersionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailVersionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
    }
    
    private func fillData() {
        appDetailVersionView.apiVersionLabel.text = "Version \(app.appVersion ?? "")"
        let dateFormatterFromModel = ISO8601DateFormatter()
        let date = dateFormatterFromModel.date(from:app.currentVersionReleaseDate ?? "") ?? Date()
        let datefFormatter = DateFormatter()
        datefFormatter.dateStyle = .medium
        let dateString = datefFormatter.string(from: date as Date)
        appDetailVersionView.releaseDateLabel.text = dateString
        appDetailVersionView.releaseNotesLabel.text = app.releaseNotes
    }

}
