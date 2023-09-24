//
//  MainViewController.swift
//  ONigiry
//
//  Created by (^ㅗ^)7 iMac on 2023/09/11.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    let textButton: UIButton = {
        let button = UIButton()
        button.setTitle("TEST BUTTON", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    let searchButton: UIButton = {
            let button = UIButton()
            let image = UIImage(systemName: "magnifyingglass")
            button.setImage(image, for: .normal)
            button.tintColor = .systemBlue
            return button
        }()

    func setupUI() {
        view.addSubview(textButton)
        textButton.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
            make.width.equalTo(150)
            make.height.equalTo(60)
        }
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            $0.width.height.equalTo(30)
            
        }
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc func searchButtonTapped() {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}
