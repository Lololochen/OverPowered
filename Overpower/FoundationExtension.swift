//
//  FoundationExtension.swift
//  OverPowered
//
//  Created by Bright Future on 18/03/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

extension Double {
    
    func string() -> String {
        return String(Int(self))
    }

}

extension String {
    
    func localizedString() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
}
