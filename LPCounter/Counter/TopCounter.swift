//
//  TopCounter.swift
//  TestCounter
//
//  Created by Lyubomyr Hlozhyk on 8/1/16.
//  Copyright © 2016 Lyupko. All rights reserved.
//

import Foundation

class TopCounter {
    
    static let instance = TopCounter()
    
    var allElapsedTime: Double = 0.0 {
        didSet {
            print("all elapsed time - ", allElapsedTime)
        }
    }
    
    //MARK: Public methods
    
    func add(time: CFAbsoluteTime) {
        self.allElapsedTime += time
    }
}
