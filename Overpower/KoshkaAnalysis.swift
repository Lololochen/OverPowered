//
//  KoshkaAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class KoshkaAnalysis: AbilityAnalysis {
    
    var calculator: Koshka {
        return Koshka(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability twirl damage".localizedString(), calculator.bAbilityTwirlDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("A ➝ B ability twirl ➝ 2 empowered basic attacks combo damage".localizedString(), (calculator.bAbilityEmpoweredBasicAttackDamage * 2 + calculator.bAbilityTwirlDamage + calculator.aAbilityDamage).string()))
        
        result.append(("A ➝ 2 empowered basic attacks ➝ B ability twirl ➝ 2 empowered basic attacks combo damage".localizedString(), (calculator.bAbilityEmpoweredBasicAttackDamage * 4 + calculator.bAbilityTwirlDamage + calculator.aAbilityDamage).string()))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Stun duration".localizedString(), roundedString(2.2)))
        
        return result
    }
}
