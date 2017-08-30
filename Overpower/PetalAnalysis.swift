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

        result.append(("Pet raw DPS".localizedString(), calculator.aAbilityPetRawDPS.string()))
        
        result.append(("Seed explosion raw damage".localizedString(), calculator.seedExplosionRawDamage.string()))
        
        result.append(("Pet health".localizedString(), calculator.aAbilityPetHealth.string()))
        
        result.append(("Pet defense".localizedString(), calculator.aAbilityPetDefense.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability cooldown".localizedString(), roundedString(calculator.bAbilitCooldown)))
        
        result.append(("Ult single explosion raw damage".localizedString(), calculator.ultRawDamagePerPet.string()))
        
        result.append(("Ult single explosion heal".localizedString(), calculator.ultHealPerPet.string()))
        
        result.append(("Charge time".localizedString(), calculator.ultChargeTime.string()))
        
        return result

    }
}
