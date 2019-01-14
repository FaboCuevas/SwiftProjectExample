//
//  Logger.swift
//  Intercambio
//
//  Created by ensimerida on 20/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation

class Logger {
    
    class func info(_ msg: Any...) {
        #if DEBUG
        print("🔵 \(msg)");
        #endif
    }
    
    class func debug(_ msg: Any...) {
        #if DEBUG
        print("🕵🏼 ", terminator:"")
        debugPrint(msg);
        #endif
    }
    
    class func error(_ msg: Any...) {
        print("❌ \(msg)");
    }
}
