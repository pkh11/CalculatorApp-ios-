//
//  Protocol.swift
//  Calc_StackView_1
//
//  Created by 박균호 on 29/11/2019.
//  Copyright © 2019 박균호. All rights reserved.
//

import UIKit


public struct Stack<T> {
    private var elements = Array<T>()
    public init() {}
    
    public mutating func pop() -> T?{
        return self.elements.popLast()
    }
    public mutating func push(element: T){
        self.elements.append(element)
    }
    public func peek() -> T?{
        return self.elements.last
    }
    public var isEmpty: Bool{
        return self.elements.isEmpty
    }
    public var count: Int {
        return self.elements.count
    }
    public mutating func removeAll(){
        self.elements.removeAll()
    }
    public mutating func removeFirst() -> T?{
        guard self.elements.count > 0 else {
            return nil
        }
        return self.elements.remove(at: 0)
    }
    public mutating func first() -> T?{
        return self.elements.first
    }
}
