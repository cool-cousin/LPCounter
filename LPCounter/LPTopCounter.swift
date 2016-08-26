//
//  TopCounter.swift
//  TestCounter
//
//  Created by Lyubomyr Hlozhyk on 8/1/16.
//  Copyright © 2016 Lyupko. All rights reserved.
//

import Foundation

public class LPTopCounter {
    
    public static let instance = LPTopCounter()
    
    public var allElapsedTime: Double = 0.0 {
        didSet {
            print("all elapsed time - ", allElapsedTime)
        }
    }
    
    //MARK: Public methods
    
    public func add(time: CFAbsoluteTime) {
        self.allElapsedTime += time
    }
}
