//
//  TimelineAPI.swift
//  skillUpTest_9_pre
//
//  Created by S N on 2018/03/06.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import TwitterKit

protocol TimelineAPIDelegate {
    func receivedTweetList(tweetList: [TweetItem])
}

final class TimelineAPI {
    
    let timelineResponse = TimelineResponse()
    var delegate: TimelineAPIDelegate!
    
    func getTimeline() {
        if let session = TWTRTwitter.sharedInstance().sessionStore.session() {
            print(session.userID)
            var clientError: NSError?
            
            let apiClient = TWTRAPIClient(userID: session.userID)
            let request = apiClient.urlRequest(
                withMethod: "GET",
                urlString: "https://api.twitter.com/1.1/statuses/home_timeline.json",
                parameters: [
                    "user_id": session.userID,
                    "count": "20" // Intで10を渡すとエラーになる模様で、文字列にしてやる必要がある
                ],
                error: &clientError
            )
            
            apiClient.sendTwitterRequest(request) { _, data, error in // NSURLResponse?, NSData?, NSError?
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data {
                    let resultList = self.timelineResponse.map(json: data)
                    self.delegate.receivedTweetList(tweetList: resultList)
                }
            }
        } else {
            print("アカウントはありません")
            TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
                if session != nil {
                    print("signed in as \(String(describing: session?.userName))")
                } else {
                    print("error: \(String(describing: error?.localizedDescription))")
                }
            })
        }
    }
}
