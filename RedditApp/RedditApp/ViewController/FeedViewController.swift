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
    @IBOutlet weak var pullToRefreshLabel: UILabel!
    @IBOutlet weak var dismissAllButton: UIButton!
    
    private let refreshControl = UIRefreshControl()
    
    var postsArray: [Post]?
    var params: String?
    var index: Int = 0
    

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
        tableView.tableFooterView = getSpinner()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl.tintColor = .orange
    }
    
    func callToServices() {
        let service = Service()
        
        service.getPosts(params: nil) { (posts) in
            self.postsArray = posts
            self.params = posts.first?.after
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.separatorStyle = .singleLine
                self.tableView.tableFooterView = self.getSpinner()
                
                self.pullToRefreshLabel.isHidden = true
                self.dismissAllButton.isHidden = false
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
    
    func getNewPosts(with indexPath: IndexPath, params: String?) {
        index = indexPath.row
        let service = Service()
        
        service.getPosts(params: params) { (posts) in
            self.postsArray?.append(contentsOf: posts)
            self.params = posts.first?.after
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func getSpinner() -> UIView {
        let viewWidth = self.view.bounds.size.width
        let spinnerView = UIView.init(frame: CGRect(x: 0, y: 0, width: Int(viewWidth), height: 30))
        spinnerView.backgroundColor = .black
        let ai = UIActivityIndicatorView.init(style: .medium)
        ai.color = UIColor(red: 235/255, green: 85/255, blue: 40/255, alpha: 1)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
        }
        
        return spinnerView
    }
    
    @IBAction func dismissAllTapped(_ sender: Any) {
        var indexPaths: [IndexPath] = []
        
        for post in postsArray ?? [] {
            if let index = postsArray?.firstIndex(where: { $0 === post }) {
                indexPaths.append(IndexPath(row: index, section: 0))
            }
        }

        postsArray = []
        pullToRefreshLabel.isHidden = false
        redditLogoImageView.isHidden = false
        dismissAllButton.isHidden = true
        tableView.deleteRows(at: indexPaths, with: .fade)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray?.count ?? 0
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == ((postsArray?.count ?? 0) - 1) && indexPath.row != index {
            if !(params?.isEmpty ?? true) {
                getNewPosts(with: indexPath, params: params)
            } else {
                tableView.tableFooterView = UIView()
            }
        }
    }
}
