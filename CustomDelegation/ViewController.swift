//
//  ViewController.swift
//  CustomDelegation
//
//  Created by Brendon Cecilio on 1/27/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    
    private var movieInfo = [Movies]()
    
    var currentFontSize: CGFloat? = 17 {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingController = segue.destination as? SettingsController else {
            fatalError("nah u goood")
        }
        settingController.delegate = self
        settingController.fontSize = currentFontSize!
    }
    
    func loadData() {
        movieInfo = Movies.allMovies
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, TableViewDelegate {
    func fontdidChange(changeVC: SettingsController, fontSize: CGFloat) {
        self.currentFontSize = changeVC.fontSize
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movieCell = movieInfo[indexPath.row]
        
        cell.textLabel?.text = movieCell.name
        cell.detailTextLabel?.text = movieCell.releaseDate
        cell.textLabel?.font = cell.textLabel!.font.withSize(currentFontSize!)
        cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(currentFontSize!)
        return cell
    }
}

