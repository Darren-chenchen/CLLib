//
//  Observable+operator.swift
//  RxSwift_Part1
//
//  Created by shengling on 2018/6/11.
//  Copyright © 2018年 ShengLing. All rights reserved.
//

import Foundation
import RxSwift

public extension Observable {
    public func doOnNext(_ closure: @escaping (Element) -> Void) -> Observable<Element> {
        return self.do(onNext: { (element) in
            closure(element)
        })
    }
    
    public func doOnError(_ closure: @escaping (Error) -> Void) -> Observable<Element> {
        return self.do(onError: { (error) in
            closure(error)
        })
    }
    
    public func doOnCompleted(_ closure: @escaping () -> Void) ->  Observable<Element> {
        return self.do(onCompleted: {
            closure()
        })
    }
    
    public func doOnSubscribe(_ closure: @escaping () -> Void) -> Observable<Element> {
        return self.do(onSubscribe: {
            closure()
        })
    }
    
    public func doOnDisposed(_ closure: @escaping () -> Void)-> Observable<Element> {
        return self.do(onDispose: {
            closure()
        })
    }
}

