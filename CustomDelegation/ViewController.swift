//
//  ViewController.swift
//  CustomDelegation
//
//  Created by Brendon Cecilio on 1/27/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

protocol TableViewDelegate: AnyObject {
    func fontdidChange(_ tablView: ViewController, fonSize: CGFloat)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: TableViewDelegate?
    
    private var movieInfo = [Movies]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        movieInfo = Movies.allMovies
    }
    
//    func fontChanged() {
//        delegate?.fontDidChange(self)
//    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movieCell = movieInfo[indexPath.row]
        
        cell.textLabel?.text = movieCell.name
        cell.detailTextLabel?.text = movieCell.releaseDate
        return cell
    }
    
    
}

