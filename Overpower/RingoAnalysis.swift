//
//  RingoAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class RingoAnalysis: AbilityAnalysis {
    
    var calculator: Ringo {
        return Ringo(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Slow strength".localizedString(), calculator.aAbilitySlowStrength))
        
        result.append(("Slow duration".localizedString(), roundedString(calculator.aAbilitySlowDuration)))
        
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.string()))
        
        result.append(("B ability total damage".localizedString(), calculator.bAbilityTotalDamage.string()))
        
        result.append(("B ability DPS".localizedString(), calculator.bAbilityDps.string()))
        
        result.append(("Max B ability damage during A ability slow with Heroic Perk".localizedString(), (calculator.bAbilityDps * calculator.aAbilitySlowDuration + calculator.bAbilityHeroicPerkBonusDamage).string()))
        
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Ult damage".localizedString(), calculator.ultTotalDamage.string()))
        
        result.append(("Impact damage".localizedString(), calculator.ultImpactDamage.string()))
        
        result.append(("Burn damage".localizedString(), calculator.ultBurnDamage.string()))
        
        result.append(("A ➝ B ➝ Ult combo max damage (ult when A ability slow ends)".localizedString(), ((calculator.bAbilityDps * calculator.aAbilitySlowDuration + calculator.bAbilityHeroicPerkBonusDamage) + calculator.ultTotalDamage).string()))
        
        return result
    }
}
