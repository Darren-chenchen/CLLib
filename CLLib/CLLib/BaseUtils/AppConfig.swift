
import UIKit

// 屏幕宽度
public var KScreenHeight = UIScreen.main.bounds.height
// 屏幕高度
public var KScreenWidth = UIScreen.main.bounds.width
//屏幕比例
public let kScale = UIScreen.main.scale
//导航栏高度
public let KNavgationBarHeight: CGFloat = DeviceUtils.isX() == true ? 88.0:64.0
//tabbar高度
public let KTabBarHeight: CGFloat = DeviceUtils.isX() == true ? 83.0:49.0
public let IphoneXMargin: CGFloat = DeviceUtils.isX() == true ? 34:0

var dialogWidth: CGFloat = 300

//MARK: - RGBA颜色
public var RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha);
}

// MARK:- 设置圆角
public func CLViewsBorder(_ view:UIView, borderWidth:CGFloat, borderColor:UIColor?=nil,cornerRadius:CGFloat){
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = borderColor?.cgColor
    view.layer.cornerRadius = cornerRadius
    view.layer.masksToBounds = true
}

public let CLWindow = UIApplication.shared.keyWindow
public let CLNotificationCenter = NotificationCenter.default
public let CLUserDefaults = UserDefaults.standard

