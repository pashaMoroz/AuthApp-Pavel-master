//
//  SearchViewController.swift
//  View Controller Lyfecycle
//
//  Created by Pavel Moroz on 01.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Search"
        setupSearchBar()
        setupElements()
        setupConstraints()
    }

    func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
       // searchController.obscuresBackgroundDuringPresentation = false
    }
}

// MARK: - Setup Views
extension SearchViewController {
    func setupElements() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

    }
}

// MARK: - Setup Constraints
extension SearchViewController {
    func setupConstraints() {

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])

    }
}

// MARK: - UiSearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
