//
//  DeviceUtils
//
//  Created by darren on 2017/9/25.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

public class DeviceUtils: NSObject {
    public static func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        
        return false
    }
    
    public static func isIOS11() -> Bool{
        if #available(iOS 11.0, *) {
            return true
        } else {
            return false
        }
    }
}
