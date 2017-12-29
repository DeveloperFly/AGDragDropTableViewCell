//
//  ViewController.swift
//  AGDragDropTableViewCell
//
//  Created by Aman Gupta on 28/12/17.
//  Copyright © 2017 Developer Fly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var bottomTableView: UITableView!
    @IBOutlet weak var topTableView: UITableView!
    //MARK: - View Lide Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == topTableView {
            let cell = topTableView.dequeueReusableCell(withIdentifier: "TopTableViewCell", for: indexPath) as! TopTableViewCell
            return cell
        } else {
            let cell = bottomTableView.dequeueReusableCell(withIdentifier: "BottomTableViewCell", for: indexPath) as! BottomTableViewCell
            return cell
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

