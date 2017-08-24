//
//  PetalAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class PetalAnalysis: AbilityAnalysis {
    
    var calculator: Petal {
        return Petal(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("Pet DPS".localizedString(), calculator.aAbilityPetDPS.string()))
        
        result.append(("DPS with basic attacks".localizedString(), calculator.aAbilityDpsWithAutoAttack.string()))
        
        result.append(("Seed explosion damage".localizedString(), calculator.aAbilitySeedExplosionDamage.string()))
        
        result.append(("Pet health".localizedString(), calculator.aAbilityPetHealth.string()))
        
        result.append(("Pet defense".localizedString(), calculator.aAbilityPetDefense.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability amplified DPS".localizedString(), (calculator.bAbilitAmplifier * calculator.aAbilityDpsWithAutoAttack).string()))
        
        result.append(("Total damage during amplification".localizedString(), ((calculator.bAbilitAmplifier * calculator.aAbilityDpsWithAutoAttack) * 4).string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilitCooldown)))
        
        result.append(("Ult total damage".localizedString(), calculator.ultTotalDamage.string()))
        
        result.append(("Single explosion damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Total heal".localizedString(), calculator.ultTotalHeal.string()))
        
        result.append(("Single explosion heal".localizedString(), calculator.ultHeal.string()))
        
        result.append(("Charge time".localizedString(), calculator.ultChargeTime.string()))
        
        return result

    }
}
