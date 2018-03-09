//
//  TimelineResponse.swift
//  skillUpTest_9_pre
//
//  Created by S N on 2018/03/06.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import SwiftyJSON

class TimelineResponse: NSObject {
    var tweetList: [TweetItem] = []
    func map(json: Any) -> [TweetItem] {
        let json = JSON(json)
        json.forEach { (_, rest) in
            let user = rest["user"]["name"].string
            let screen = rest["user"]["screen_name"].string
            let thumbnailUrl = rest["user"]["profile_image_url_https"].string
            let text = rest["text"].string
            
            tweetList.append(TweetItem(user: user!, screen: screen!, thumbnailUrl: thumbnailUrl!, text: text!))
        }
        return tweetList
    }
}
