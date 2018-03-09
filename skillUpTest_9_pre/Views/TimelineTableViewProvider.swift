//
//  TimelineTableViewProvider.swift
//  skillUpTest_9_pre
//
//  Created by S N on 2018/03/09.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import UIKit

class TimelineTableViewProvider: NSObject {
    var tweetList: [TweetItem] = []
    
    func set(tweetList: [TweetItem]) {
        self.tweetList = tweetList
    }
}

extension TimelineTableViewProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as? TimelineTableViewCell else {
            fatalError("TweetCellがありません")
        }
        cell.name.text = tweetList[indexPath.row].user
        cell.screen.text = tweetList[indexPath.row].screen
        
        cell.tweetText.text = tweetList[indexPath.row].text
        
        return cell
    }
    
}
