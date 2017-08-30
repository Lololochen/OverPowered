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

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability twirl raw damage".localizedString(), calculator.bAbilityTwirlRawDamage.string()))
        
        result.append(("B ability buff raw damage".localizedString(), calculator.bAbilityEmpoweredRawDamage.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw damage".localizedString(), calculator.ultRawDamage.string()))
                
        return result
    }
}
