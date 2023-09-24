//
//  MainViewController.swift
//  ONigiry
//
//  Created by (^ㅗ^)7 iMac on 2023/09/11.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    var tableView = CustomTableView(frame: .zero, style: .insetGrouped)

    let tempSection = ["애니메이션", "영화", "여행"]
}

extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension MainViewController {
    func setup() {
        view.backgroundColor = .systemBackground
        setupTableView()
        registerCell()
    }

    func setupTableView() {
        tableView.dataSource = self

        tableView.backgroundColor = .systemPink
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }

    func registerCell() {
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tempSection.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as? MainCell else { return UITableViewCell() }
        cell.backgroundColor = .systemOrange
        return cell
    }
}
