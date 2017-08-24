//
//  TakaAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class TakaAnalysis: AbilityAnalysis {
    
    var calculator: Taka {
        return Taka(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.string()))
        
        result.append(("Cooldown on 5 Ki stacks".localizedString(), (calculator.aAbilityCooldown / 2).string()))
        
        result.append(("B ability stealth duration".localizedString(), calculator.bAbilityStealthDuration.string()))
        
        result.append(("Total heal".localizedString(), calculator.bAbilityHeal.string()))
        
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Cooldown on 5 Ki stacks".localizedString(), (calculator.bAbilityCooldown / 2).string()))
        
        result.append(("Ult total damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Bleed damage".localizedString(), calculator.ultBleedDamage.string()))
        
        result.append(("Ult cooldown".localizedString(), calculator.ultCooldown.string()))
        
        result.append(("Cooldown on 5 Ki stacks".localizedString(), (calculator.ultCooldown / 2).string()))
        
        return result

    }
}
