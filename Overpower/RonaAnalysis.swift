//
//  RonaAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class RonaAnalysis: AbilityAnalysis {
    
    var calculator: Rona {
        return Rona(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability impact damage".localizedString(), calculator.aAbilityImpactDamage.string()))
        
        result.append(("Rupture damage".localizedString(), calculator.aAbilityRuptureDamage.string()))
        
        result.append(("Fortified health from single target".localizedString(), calculator.aAbilityFortifiedHealthFromSingleTarget.string()))
        
        result.append(("Fortified health from triple targets".localizedString(), calculator.aAbilityFortifiedHealthFromTripleTargets.string()))
        
        result.append(("Blood rage gain from single target".localizedString(), calculator.aAbilityBloodRageGainOnSingleTarget.string()))
        
        result.append(("Blood rage gain from triple targets".localizedString(), calculator.aAbilityBloodRageGainOnTripleTargets.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability first hit damage".localizedString(), calculator.bAbilityFirstAttackDamage.string()))
        
        result.append(("Damage with 2nd hit".localizedString(), (calculator.bAbilityFirstAttackDamage + calculator.bAbilitySecondAttackDamage).string()))
        
        result.append(("Blood rage gain".localizedString(), calculator.bAbilityBloodRageGain.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Miminum cooldown in fight (basic attacking enemy non-stop)".localizedString(), roundedString(calculator.bAbilityCooldownInFight)))
        
        result.append(("Ult DPS".localizedString(), calculator.ultDps.string()))
        
        result.append(("Fortified health per second".localizedString(), calculator.ultFortifiedHealPerSec.string()))
        
        return result
    }
}
