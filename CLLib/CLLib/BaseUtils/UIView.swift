//
// Created by Neil Spears on 2017/1/11.
// Copyright (c) 2017 Heading. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    
    public var cl_x: CGFloat {
        
        get {
            return self.frame.origin.x
        }
        
        set(newVal) {
            var cl_frame: CGRect = self.frame
            cl_frame.origin.x = newVal
            self.frame = cl_frame
            
        }
        
    }
    
    
    public var cl_y: CGFloat {
        
        get {
            return self.frame.origin.y
        }
        
        set(newVal) {
            var cl_frame: CGRect = self.frame
            cl_frame.origin.y = newVal
            self.frame = cl_frame
            
        }
        
    }
    
    public var cl_width: CGFloat {
        
        get {
            return self.frame.size.width
        }
        
        set(newVal) {
            var cl_frame: CGRect = self.frame
            cl_frame.size.width = newVal
            self.frame = cl_frame
            
        }
        
    }

    public var width: CGFloat {
        
        get {
            return self.frame.size.width
        }
        
        set(newVal) {
            var cl_frame: CGRect = self.frame
            cl_frame.size.width = newVal
            self.frame = cl_frame
            
        }
        
    }

    
    public var cl_height: CGFloat {
        
        get {
            return self.frame.size.height
        }
        
        set(newVal) {
            var cl_frame: CGRect = self.frame
            cl_frame.size.height = newVal
            self.frame = cl_frame
            
        }
        
    }

    public var height: CGFloat {
        
        get {
            return self.frame.size.height
        }
        
        set(newVal) {
            var cl_frame: CGRect = self.frame
            cl_frame.size.height = newVal
            self.frame = cl_frame
            
        }
        
    }

    
    
    public var cl_size: CGSize {
        
        get {
            return self.frame.size
        }
        
        set(newVal) {
            var cl_frame: CGRect = self.frame
            cl_frame.size = newVal
            self.frame = cl_frame
            
        }
        
    }

    
    public var size: CGSize {
        
        get {
            return self.frame.size
        }
        
        set(newVal) {
            var cl_frame: CGRect = self.frame
            cl_frame.size = newVal
            self.frame = cl_frame
            
        }
        
    }

    
    
    
    public var cl_centerX: CGFloat {
        
        get {
            return self.center.x
        }
        
        set(newVal) {
            var cl_center: CGPoint = self.center
            cl_center.x = newVal
            self.center = cl_center
            
        }
        
    }

    
    public var centerX: CGFloat {
        
        get {
            return self.center.x
        }
        
        set(newVal) {
            var cl_center: CGPoint = self.center
            cl_center.x = newVal
            self.center = cl_center
            
        }
        
    }

    
    public var cl_centerY: CGFloat {
        
        get {
            return self.center.y
        }
        
        set(newVal) {
            var cl_center: CGPoint = self.center
            cl_center.y = newVal
            self.center = cl_center
            
        }
        
    }

    
    public var centerY: CGFloat {
        
        get {
            return self.center.y
        }
        
        set(newVal) {
            var cl_center: CGPoint = self.center
            cl_center.y = newVal
            self.center = cl_center
            
        }
    }

    
    func setBudget(count:String){
        
    }
    
}
