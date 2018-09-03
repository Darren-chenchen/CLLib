//
//  UpdateModel.swift
//  UpdateSDK
//
//  Created by Zhiqiang Deng on 2017/8/4.
//  Copyright © 2017年 Zhiqiang Deng. All rights reserved.
//

import Foundation
import ObjectMapper

public class UpdateModel: Mappable {
    
    var ios: UpdateSubModel?
    var android: UpdateSubModel?
    
    
    init() {
    }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        ios <- map["ios"]
        android <- map["android"]
    }
}
class UpdateSubModel: Mappable {
    
    var version: String?
    var updateInfo: String?
    var apkLink: String?
    
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        version <- map["version"]
        updateInfo <- map["updateInfo"]
        apkLink <- map["apkLink"]
    }
}
