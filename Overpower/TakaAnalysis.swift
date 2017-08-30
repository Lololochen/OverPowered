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

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("A ability cooldown".localizedString(), calculator.aAbilityCooldown.string()))
        
        result.append(("B ability total heal".localizedString(), calculator.bAbilityHeal.string()))
        
        result.append(("B ability cooldown".localizedString(), calculator.bAbilityCooldown.string()))

        result.append(("Ult total raw damage".localizedString(), calculator.ultTotalRawDamage.string()))
        
        result.append(("Ult cooldown".localizedString(), calculator.ultCooldown.string()))
        
        return result

    }
}
