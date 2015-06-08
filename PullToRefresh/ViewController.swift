//
//  ViewController.swift
//  PullToRefresh
//
//  Created by qingjiezhao on 6/8/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource {

    let cellIdentifier = "cell"
    let smallItemAnimals = ["Cat,","Dog","Bird"]
    let bigItemAnimals = ["Cow","Horse"]
    
    var tableData = [String]()
    var tableViewController = UITableViewController(style: .Plain)
    
    var refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableData = smallItemAnimals
        
        var tableView = tableViewController.tableView
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier : cellIdentifier)
        tableView.dataSource = self
        
        tableViewController.refreshControl = self.refreshControl
        
        self.refreshControl.addTarget(self, action: "didRefreshList", forControlEvents: .ValueChanged)
        
        //self.refreshControl.backgroundColor = UIColor.orangeColor()
        //self.refreshControl.attributedTitle = NSAttributedString(string: "last update on \(NSDate())")
        
        self.view.addSubview(tableView)
        
    }
    
    func didRefreshList(){
        self.tableData = bigItemAnimals
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell
        
        cell.textLabel?.text = self.tableData[indexPath.row]
        
        return cell
        
    }

    


}

