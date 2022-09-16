//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by Kamilla Mylena Teixeira Antunes on 09/09/22.
//

import UIKit

class SearchViewController: UIViewController {
    private var titles = [Title]()
    
    private lazy var searchTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(searchTable)
        
        searchTable.delegate = self
        searchTable.dataSource = self
        
        fetchSearchMovies()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTable.frame = view.bounds
    }
    
    private func fetchSearchMovies() {
        APICaller.shared.getSearchMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                
                DispatchQueue.main.async {
                    self?.searchTable.reloadData()
                }
            case . failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else { return UITableViewCell() }
        
        let title = titles[indexPath.row]
        let titleName = title.originalTitle ?? title.originalName ?? "Unknown title name"
        let posterPath = title.posterPath ?? ""
        cell.configure(with: TitleViewModel(titleName: titleName, posterPath: posterPath))
        
        return cell
    }
}
