//
//  SearchSelectViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Зинде Иван on 11/24/20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class SearchSelectViewController: UIViewController {
    
    private var searchSelectView: SearchSelectView {
        return self.view as! SearchSelectView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SearchSelectView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        searchSelectView.appSearchButton.addTarget(self, action: #selector(appSearchButtonAction), for: .touchUpInside)
        searchSelectView.songSearchButton.addTarget(self, action: #selector(songSearchButtonAction), for: .touchUpInside)
    }
    
    @objc func appSearchButtonAction(sender: UIButton!) {
        let appSearchController = SearchBuilder.build()
        appSearchController.navigationItem.title = "Search apps via iTunes"
        self.navigationController?.pushViewController(appSearchController, animated: true)
       }
    
    @objc func songSearchButtonAction(sender: UIButton!) {
        let songSearchController = SongSearchBuilder.build()
        songSearchController.navigationItem.title = "Search songs via iTunes"
        self.navigationController?.pushViewController(songSearchController, animated: true)
       }

}
