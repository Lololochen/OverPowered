//
//  AdagioAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 03/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class AdagioAnalysis: AbilityAnalysis {
    
    var calculator: Adagio {
        return Adagio(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())
        
        result.append(("Arcane fire damage".localizedString(), calculator.aAbilityDamage.string()))
        
        result.append(("Total heal".localizedString(), calculator.aAbilityHeal.string()))
        
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.string()))
        
        result.append(("B ability self cast, target on fire DPS".localizedString(), calculator.bAbilityMaxDPS.string()))
        
        result.append(("B ability self cast, target not on fire DPS".localizedString(), calculator.bAbilityMinDPS.string()))
        
        result.append(("Buff ally, target on fire per shot damage".localizedString(), calculator.bAbilityBuffDamagePerShotMax.string()))
        
        result.append(("Buff ally, target not on fire per shot damage".localizedString(), calculator.bAbilityBuffDamagePerShotMin.string()))
        
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        return result
    }

}
