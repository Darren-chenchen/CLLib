//
//  CustomNavgationView.swift
//  CloudscmSwift
//
//  Created by 陈亮陈亮 on 2017/5/16.
//  Copyright © 2017年 RexYoung. All rights reserved.
//

import UIKit

public class CLCustomNavgationView: UIView {
    
    public lazy var titleLable:UILabel = {
        let titleLable = UILabel()
        titleLable.textAlignment = .center
        titleLable.font = UIFont.boldSystemFont(ofSize: 18)
        return titleLable
    }()
    public lazy var navLine:UIView = {
        let navLine = UIView()
        navLine.backgroundColor = UIColor.groupTableViewBackground
        return navLine
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.titleLable)
        self.addSubview(self.navLine)
        initEventHendle()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initEventHendle() {
        self.titleLable.snp.makeConstraints { (make) in
            make.leading.equalTo(self).offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(44)
            make.centerY.equalTo(self).offset(DeviceUtils.isX()==true ? 15:8)
        }
        self.navLine.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    override public func layoutSubviews() {
    }
}
