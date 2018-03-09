//
//  ThumbnailDao.swift
//  skillUpTest_9_pre
//
//  Created by S N on 2018/02/27.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import UIKit

final class ThumbnailDao {
    static let daoHelper = RealmDaoHelper<ThumbnailDto>()

    static func addThumbnail(name: String, image: UIImage) {
        let thumbnail = ThumbnailDto()
        
        thumbnail.userName = name
        thumbnail.image = image
        
        daoHelper.add(object: thumbnail)
    }
    
    static func findByName(name: String) -> ThumbnailDto? {
        let thumbnail = daoHelper.findFirst(key: name as AnyObject)
        return thumbnail
    }
}
