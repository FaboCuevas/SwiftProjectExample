//
//  Loader.swift
//  Intercambio
//
//  Created by ensimerida on 21/12/18.
//  Copyright © 2018 ensimerida. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class Loader {
    private let activityData = ActivityData(size: CGSize(width: 50.0, height: 50.0), message: nil, messageFont: nil, messageSpacing: nil, type: NVActivityIndicatorType.ballPulse, color: nil, padding: nil, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: nil, textColor: nil)
    
    public class var sharedInstance: Loader {
        struct Static {
            static let instance : Loader = Loader()
        }
        return Static.instance
    }
    
    func show(_ msg: String? = nil) {
        NVActivityIndicatorPresenter.sharedInstance.setMessage(msg)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    func hide(){
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
}
