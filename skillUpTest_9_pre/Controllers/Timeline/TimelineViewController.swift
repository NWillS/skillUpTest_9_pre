//
//  TimelineViewController.swift
//  skillUpTest_9_pre
//
//  Created by S N on 2018/02/27.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import TwitterKit
import UIKit

class TimelineViewController: UIViewController {
    let api = TimelineAPI()
    let dataSource = TimelineTableViewProvider()
    var tweetList: [TweetItem] = []

    @IBOutlet weak private var timelineTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timelineTableView.dataSource = dataSource
        api.delegate = self

        api.getTimeline()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TimelineViewController: TimelineAPIDelegate {
    func receivedTweetList(tweetList: [TweetItem]) {
        dataSource.set(tweetList: tweetList)
        timelineTableView.reloadData()
    }
    
}
