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
        
        result.append(("Arcane fire damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("Total heal".localizedString(), calculator.aAbilityHeal.string()))
        
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.string()))
        
        result.append(("B ability self cast, target on fire raw crystal DPS".localizedString(), calculator.bAbilityMaxRawCrystalDPS.string()))
        
        result.append(("B ability self cast, target not on fire raw crystal DPS".localizedString(), calculator.bAbilityMinRawCrystalDPS.string()))
        
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.string()))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
        
        return result
    }

}
