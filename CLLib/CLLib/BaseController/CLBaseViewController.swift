//
//  BaseNavViewController.swift
//  CloudscmSwift
//
//  Created by Darren on 17/5/2.
//  Copyright © 2017年 RexYoung. All rights reserved.
//

import UIKit
import SnapKit

public class CLBaseViewController: UIViewController {
    
    // 自定义导航栏
    public lazy var customNavBar: CLCustomNavgationView = {
        let nav = CLCustomNavgationView()
        nav.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: KNavgationBarHeight)
        nav.backgroundColor = UIColor.white
        return nav
    }()
    // 右边第一个按钮
    public lazy var rightBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect.zero
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(CLBaseViewController.rightBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    // 右边第二个按钮
    public lazy var rightBtnTwo: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect.zero
        btn.adjustsImageWhenHighlighted = false
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(CLBaseViewController.rightBtnTwoClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    // 标题
    public var navTitle = "" {
        didSet{
            customNavBar.titleLable.text = navTitle
        }
    }
    public var navTitleColor = UIColor.black {
        didSet{
            customNavBar.titleLable.textColor = navTitleColor
        }
    }
    public var navBgColor = UIColor.white {
        didSet{
            customNavBar.backgroundColor = navBgColor
        }
    }
    // 返回按钮
    public lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect.zero
        
        btn.setImage(UIImage(named: "ic_back_grey", in: BundleUtil.getCurrentBundle(), compatibleWith: nil), for: .normal)
        btn.addTarget(self, action: #selector(CLBaseViewController.backBtnclick), for: .touchUpInside)
        return btn
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        
        setupNav()
        
        setupLayout()
    }
    func setupLayout() {
        self.rightBtn.snp.makeConstraints { (make) in
            make.left.equalTo(KScreenWidth-47)
            make.width.equalTo(44)
            make.height.equalTo(44)
            make.centerY.equalTo(self.customNavBar.titleLable.snp.centerY)
        }
        self.rightBtnTwo.snp.makeConstraints { (make) in
            make.left.equalTo(KScreenWidth-96)
            make.width.equalTo(44)
            make.height.equalTo(44)
            make.centerY.equalTo(self.customNavBar.titleLable.snp.centerY)
        }
        self.backBtn.snp.makeConstraints { (make) in
            make.left.equalTo(4)
            make.width.equalTo(44)
            make.height.equalTo(44)
            make.centerY.equalTo(self.customNavBar.titleLable.snp.centerY)
        }
    }
    
    fileprivate func setupNav(){
        
        // 添加导航栏
        self.view.addSubview(self.customNavBar)
        
        // 右边按钮
        self.customNavBar.addSubview(self.rightBtn)
        self.customNavBar.addSubview(self.rightBtnTwo)
        self.customNavBar.addSubview(self.backBtn)
        
        // 多层push才显示返回按钮
        // 多层push才显示返回按钮
        if self.navigationController != nil {
            if ((self.navigationController?.childViewControllers.count)!>1){
                self.backBtn.isHidden = false
            } else {
                self.backBtn.isHidden = true
            }
        }
    }
    
    @objc public func rightBtnTwoClick() {
        
    }
    
    @objc public func rightBtnClick(){
        
    }
    @objc public func backBtnclick(){
        let VCArr = self.navigationController?.viewControllers
        if VCArr == nil {
            self.dismiss(animated: true, completion: nil)
            return
        }
        if VCArr!.count > 1 {
            self.navigationController!.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    //状态栏颜色默认为黑色
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    //点击空白处, 回收键盘
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}
