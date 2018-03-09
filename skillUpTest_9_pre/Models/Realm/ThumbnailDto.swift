//
//  ThumbnailDto.swift
//  skillUpTest_9_pre
//
//  Created by S N on 2018/02/27.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import RealmSwift

class ThumbnailDto: Object {
    @objc dynamic var userName = ""
    @objc dynamic var image = UIImage()
    
    override static func primaryKey() -> String? {
        return "userName"
    }
}
