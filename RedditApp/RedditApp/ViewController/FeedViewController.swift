//
//  FeedViewController.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, Dismissable {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var redditLogoImageView: UIImageView!
    
    private let refreshControl = UIRefreshControl()
    
    var postsArray: [Post]?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Reddit Posts"
        setupTableView()
        callToServices()
    }


    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: Bundle.init(for: FeedTableViewCell.self)), forCellReuseIdentifier: "FeedTableViewCell")
        tableView.tableFooterView = UIView()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl.tintColor = .orange
    }
    
    func callToServices() {
        let service = Service()
        
        service.getPosts { (posts) in
            self.postsArray = posts
            DispatchQueue.main.async {
                self.redditLogoImageView.isHidden = true
                self.tableView.reloadData()
                self.tableView.separatorStyle = .singleLine
                self.redditLogoImageView.isHidden = true
            }
        }
    }
    
    @objc private func refreshData(_ sender: Any) {
        callToServices()
        refreshControl.endRefreshing()
    }
    
    func dismissPost(_ post: Post) {
        if let index = postsArray?.firstIndex(where: { $0 === post }) {
            
            let indexPath = IndexPath(row: index, section: 0)

            postsArray?.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func dismissAllTapped(_ sender: Any) {
        var indexPaths: [IndexPath] = []
        
        for post in postsArray ?? [] {
            if let index = postsArray?.firstIndex(where: { $0 === post }) {
                indexPaths.append(IndexPath(row: index, section: 0))
            }
        }

        postsArray = []
        tableView.separatorStyle = .none
        redditLogoImageView.isHidden = false
        tableView.deleteRows(at: indexPaths, with: .fade)
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath)
        
        if let cell = cell as? FeedTableViewCell, let post = postsArray?[indexPath.row] {
            cell.delegate = self
            cell.setupContent(with: post)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let nextVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            nextVC.post = postsArray?[indexPath.row]
            
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
