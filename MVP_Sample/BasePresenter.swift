//
//  BasePresenter.swift
//  MVP_Sample
//
//  Created by Carlos Duclos on 9/17/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation
import UIKit

class BasePresenter<V: UIViewController> {
    
    weak var viewController: V?
    
    func attachView(view: V) {
        viewController = view
    }
    
}
