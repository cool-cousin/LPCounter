//
//  Counter.swift
//  TestCounter
//
//  Created by Lyubomyr Hlozhyk on 8/1/16.
//  Copyright © 2016 Lyupko. All rights reserved.
//

import Foundation

class LPCounter {
    
    //MARK: - Private Properties
    
    private var startTime: CFAbsoluteTime?

    private var endTime: CFAbsoluteTime?
    
    private var topCounter: LPTopCounter?
    
    //MARK: - Public Properties
    
    var durationElapsed: CFAbsoluteTime? {
        guard let hasStartTime = self.startTime else {
            print("Duration haven't startTime")
            return nil
        }
        return CFAbsoluteTimeGetCurrent() - hasStartTime
    }
    
    var totalTime: CFAbsoluteTime? = 0.0
    
    //MARK: - Constructors
    
    convenience init(startImmediately now: Bool, topCounter: LPTopCounter) {
        self.init(startImmediately: now)
        
        self.topCounter = topCounter
    }
    
    init(startImmediately now: Bool) {
        if now {
            start()
        }
    }
    
    deinit {
        self.startTime = nil
        self.endTime = nil
    }
    
    //MARK: - Private methods
    
    private func addElapsedTime(time: CFAbsoluteTime?) {
        
        guard time != nil else {
            print("Duration haven't startTime")
            return
        }
        
        if let counter = topCounter {
            counter.add(time!)
        }
    }
    
    //MARK: - Public methods
    
    func start() {
        if self.startTime == nil {
            self.startTime = CFAbsoluteTimeGetCurrent()
        }
    }
    
    func reset() {
        self.startTime = nil
        self.endTime = nil
        self.totalTime = nil
    }
    
    func stop() {
        defer {
            self.startTime = nil
            self.endTime = nil
        }
        
        guard let hasStartTime = self.startTime else {
            print("Duration haven't startTime")
            return
        }
        
        self.endTime = CFAbsoluteTimeGetCurrent()
        totalTime = self.endTime! - hasStartTime
        print(NSThread.currentThread())
        addElapsedTime(self.endTime! - hasStartTime)
    }
    
    // MARK: - Methods of class
    
    static func durationFunc <A> (@autoclosure f: () -> A) -> (result: A, duration: CFAbsoluteTime) {
        let timer = LPCounter(startImmediately: false)
        timer.start()
        let result = f()
        timer.stop()
        return (result, timer.totalTime!)
    }
    
}

