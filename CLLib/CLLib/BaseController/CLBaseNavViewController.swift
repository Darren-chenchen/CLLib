//
//  BaseNavViewController.swift
//
//  Created by darren on 2017/9/12.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

public class CLBaseNavViewController: UINavigationController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
    }    
    //push时候自动隐藏bottomBar
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
    }
    override public func popViewController(animated: Bool) -> UIViewController? {
        return  super.popViewController(animated: animated)
    }
    

}
