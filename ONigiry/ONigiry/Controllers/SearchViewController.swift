//
//  SearchViewController.swift
//  ONigiry
//
//  Created by (^ㅗ^)7 iMac on 2023/09/11.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    let searchBar = UISearchBar()
    var searchHistory: [(text: String, timestamp: Date)] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    func setupUI() {
        
        searchBar.placeholder = "지금 바로 검색하세요"
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.autocapitalizationType = .none
        navigationItem.titleView = searchBar
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchHistoryCell")
        // TableViewCell 파일을 굳이 만들지 않아도 위와같이 작성하면 기본적인 셀스타일로 표현 가능
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func addSearchToHistory(searchText: String) {
        let timestamp = Date()
        searchHistory.insert((text: searchText, timestamp: timestamp), at: 0)
        tableView.reloadData()
    }
    
    func formatTimestamp(_ timestamp: Date) -> NSAttributedString {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd HH:mm" // 작게 표기
        dateFormatter.timeZone = TimeZone.current // 현재 시간대로 설정
        let dateString = dateFormatter.string(from: timestamp)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 12)
        ]
        
        return NSAttributedString(string: dateString, attributes: attributes)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.isHidden = false
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        tableView.isHidden = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            print("검색어: \(searchText)")
            addSearchToHistory(searchText: searchText)
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchHistoryCell", for: indexPath)
        let searchEntry = searchHistory[indexPath.row]
        cell.textLabel?.text = "\(searchEntry.text) - \(formatTimestamp(searchEntry.timestamp).string)"
        return cell
    }
}
