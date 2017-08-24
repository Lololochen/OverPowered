//
//  Namable.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class Namable {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Namable: Equatable {
    
    static func == (lhs: Namable, rhs: Namable) -> Bool {
        return lhs.name == rhs.name
    }
    
    static func matchSelectable(_ name: String) -> Namable? {
        let item = Item.all.filter( { $0.name == name } )
        if item.count == 1 { return item[0] }
        let hero = Hero.all.filter( { $0.name == name } )
        if hero.count == 1 { return hero[0] }
        return nil
    }
}
