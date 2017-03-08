//
//  TopCounter.swift
//  TestCounter
//
//  Created by Lyubomyr Hlozhyk on 8/1/16.
//  Copyright © 2016 Lyupko. All rights reserved.
//

import Foundation

open class LPTopCounter {
    
    open static let instance = LPTopCounter()
    
    open var allElapsedTime: Double = 0.0 {
        didSet {
            if allowLogs {
                printStateElapsedTime()
            }
        }
    }
    
    open var allowLogs = false
    open var identifier = ""
    
    fileprivate var callsCount = 0
    
    //MARK: - Constructors
    
    public convenience init(globalIndetifier: String = "LPTopCounter", printAfter: Int) {
        self.init()
        identifier = globalIndetifier
        
        if printAfter != 0 {
             Timer.scheduledTimer(timeInterval: TimeInterval(printAfter), target: self, selector: #selector(printStateElapsedTime), userInfo: nil, repeats: true)
        } else {
            allowLogs = true
        }
    }
    
    public convenience init(allowLogs state: Bool, globalIndetifier: String = "LPTopCounter") {
        self.init()
        allowLogs = state
        identifier = globalIndetifier
    }
    
    //MARK: -  Public methods
    
    open func add(_ time: CFAbsoluteTime, from: String) {
        self.allElapsedTime += time
        callsCount += 1
        
        if !from.isEmpty && allowLogs {
            print("added time: \(time) from: \(from)")
        }
    }
    
    open func printCounterCalls() {
        print("\(identifier) counter called - ", callsCount)
    }
    
    @objc open func printStateElapsedTime() {
        print("\(identifier): all elapsed time - ", allElapsedTime)
    }
    
}
