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
            if allowLogs {
                printStateElapsedTime()
            }
        }
    }
    
    public var allowLogs = false
    public var identifier = ""
    
    private var callsCount = 0
    
    //MARK: - Constructors
    
    public convenience init(globalIndetifier: String = "LPTopCounter", printAfter: Int) {
        self.init()
        identifier = globalIndetifier
        
        if printAfter != 0 {
             NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(printAfter), target: self, selector: #selector(printStateElapsedTime), userInfo: nil, repeats: true)
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
    
    public func add(time: CFAbsoluteTime, from: String) {
        self.allElapsedTime += time
        callsCount += 1
        
        if !from.isEmpty && allowLogs {
            print("added time: \(time) from: \(from)")
        }
    }
    
    public func printCounterCalls() {
        print("\(identifier) counter called - ", callsCount)
    }
    
    @objc public func printStateElapsedTime() {
        print("\(identifier): all elapsed time - ", allElapsedTime)
    }
    
}
