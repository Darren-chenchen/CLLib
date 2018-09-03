//
//  CLUpdateDialog.swift
//  Konka
//
//  Created by nick xu on 2017/5/25.
//  Copyright © 2017年 Heading. All rights reserved.
//

import UIKit
import SnapKit

public class CLUpdateDialog: UIViewController {
    
    public var leftAction: ((_ alertController: CLUpdateDialog) -> ())?
    public var rightAction: ((_ alertController: CLUpdateDialog) -> ())?
    
    public var margin: CGFloat = 16
    public var alertWidth: CGFloat = 283
    
    fileprivate var currentVC: UIViewController {
        return getCurrentViewController()!
    }
    
    public static let instance: CLUpdateDialog = CLUpdateDialog.init(nibName: nil, bundle: nil)
    
    //MARK: - life cycle
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nibBundleOrNil)
       
        view.backgroundColor =  UIColor.init(red:  CGFloat(0) / 255.0, green: CGFloat(0) / 255.0, blue: CGFloat(0) / 255.0, alpha: 0.5)
        
        let newVersionLabel = UILabel()
        
        newVersionLabel.text = "发现新版本啦"
        newVersionLabel.font = UIFont.boldSystemFont(ofSize: 22)
        newVersionLabel.textColor = UIColor.white
        
        self.modalPresentationStyle = .overFullScreen
        
        backView.backgroundColor = UIColor.clear
        bottomView.backgroundColor = UIColor.white
        
        view.addSubview(backView)
        // 分成2部分
        backView.addSubview(bgView)
        backView.addSubview(bottomView)

        backView.addSubview(icon)
        backView.addSubview(newVersionLabel)
        backView.addSubview(hLineView)
        backView.addSubview(titleLabel)
        backView.addSubview(messageLabel)
        backView.addSubview(leftButton)
        backView.addSubview(rightButton)
        backView.addSubview(vLineView)
        
        backView.snp.makeConstraints { (make) in
            make.centerY.equalTo(view).offset(4.5)
            make.centerX.equalTo(view)
            make.height.equalTo(alertWidth * 1.1)
            make.width.equalTo(alertWidth)
        }
        
        icon.snp.remakeConstraints { (make) in
            make.top.equalTo(backView).offset(-25)
            make.centerX.equalTo(backView)
            make.width.equalTo(alertWidth)
        }
        
        bgView.snp.makeConstraints{ (make) in
            make.top.equalTo(backView)
            make.centerX.equalTo(backView)
            make.width.equalTo(alertWidth)
            make.bottom.equalTo(icon.snp.bottom)
        }
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.bottom)
            make.centerX.equalTo(view)
            make.bottom.equalTo(backView.snp.bottom)
            make.width.equalTo(alertWidth)
        }
        newVersionLabel.snp.makeConstraints { (make) in
            
            make.top.equalToSuperview().offset(85)
            make.centerX.equalToSuperview()
        }
        
        hLineView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(backView)
            make.bottom.equalTo(backView).offset(-50)
            make.height.equalTo(0.5)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.icon.snp.bottom).offset(5)
            make.leading.equalTo(backView).offset(margin)
            make.trailing.equalTo(backView).offset(-margin)
        }
    
        
        icon.image = UIImage(named: "updatecombg", in: BundleUtil.getCurrentBundle(), compatibleWith: UITraitCollection())

    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundCorners(bgView,[.topLeft, .topRight], radius: 9)
        roundCorners(bottomView,[.bottomLeft, .bottomRight], radius: 9)

        bgView.layer.backgroundColor = UIColor.red.cgColor
        
        icon.image = UIImage(named: "updatecombg", in: BundleUtil.getCurrentBundle(), compatibleWith: UITraitCollection())
    }
    
    func roundCorners(_ view:UIView,_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
        
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
    //update
    public func cl_updateAppAlert(updateInfo: UpdateModel, updateAction: @escaping (_ alertController: CLUpdateDialog) -> ()) {
        
        let message = updateInfo.ios?.updateInfo ?? ""
        let versionName = updateInfo.ios?.version ?? ""
        
        messageLabel.text = message
        
        titleLabel.text = "V" + versionName + " 版本特征"
        let size = message.boundingRect(with: CGSize(width: alertWidth - 2 * margin, height: 80), options: .usesLineFragmentOrigin,attributes: [NSAttributedStringKey.font: messageLabel.font!], context: nil)
        messageLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
            make.bottom.equalTo(hLineView).offset(-10)
            make.leading.equalTo(backView).offset(margin - 5)
            make.trailing.equalTo(backView).offset(-margin + 5)
            make.height.equalTo(size.height + 16)
        }
        leftAction = { _ in
            self.cl_dismiss()
        }
        
        rightAction = updateAction
        
        leftButton.setTitleColor(UIColor.red, for: .normal)
        leftButton.setTitle("立即升级", for: .normal)
        leftAction = updateAction
        
        leftButton.snp.remakeConstraints { (make) in
            make.height.equalTo(50)
            make.bottom.equalTo(backView)
            make.leading.equalTo(backView)
            make.trailing.equalTo(backView)
        }
        rightButton.snp.remakeConstraints { (make) in
            make.height.equalTo(50)
            make.bottom.equalTo(backView)
            make.leading.equalTo(backView.snp.centerX)
            make.trailing.equalTo(backView)
        }
        vLineView.snp.remakeConstraints { (make) in
            make.bottom.equalTo(backView)
            make.leading.equalTo(backView.snp.centerX)
            make.width.equalTo(0.5)
            make.height.equalTo(50)
        }
        
        rightButton.isHidden = true
        vLineView.isHidden = true
        if view.superview == nil {
            
            currentVC.present(self, animated: false, completion: nil)
        }
    }
    
    //MARK: - private
    public func cl_dismiss() {
        
        self.dismiss(animated: false, completion: nil)
    }
    
    func getCurrentViewController() -> UIViewController?{
        
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        
        if let tabController = rootController as? UITabBarController   {
            
            if let navController = tabController.selectedViewController as? UINavigationController{
                return navController.childViewControllers.last
            }else{
                return tabController
            }
        }else if let navController = rootController as? UINavigationController {
            
            return navController.childViewControllers.last
        }else{
            
            return rootController
        }
    }
    
    // - Parameter topView
    
    @objc func onLeft() {
        
        if let action = leftAction {
            action(self)
        }
    }
    
    @objc func onRight() {
        
        if let action = rightAction {
            action(self)
        }
    }
    
    //MARK: - lazy loading
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 9
        return view
    }()
    
    lazy var bgView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    //标题
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14.0)
        
        return label
    }()
    
    //message
    lazy var messageLabel: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor(white: 102.0 / 255.0, alpha: 1.0)
        textView.isEditable = false
        textView.indicatorStyle = .white
        textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 13.0)
        textView.textAlignment = .left
        return textView
    }()
    
    // HLine
    lazy var hLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 229.0 / 255.0, alpha: 1.0)
        return view
    }()
    
    //Vline
    lazy var vLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 229.0 / 255.0, alpha: 1.0)
        return view
    }()
    
    //firstButton
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(white: 136.0 / 255.0, alpha: 1.0), for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        button.addTarget(self, action: #selector(onLeft), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    //secondButton
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        button.addTarget(self, action: #selector(onRight), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    //icon
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
}

