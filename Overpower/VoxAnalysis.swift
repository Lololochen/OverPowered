//
//  VoxAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class VoxAnalysis: AbilityAnalysis {
    
    var calculator: Vox {
        return Vox(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Resonance bounce raw DPS".localizedString(), calculator.bounceRawDPS.string()))
        
        result.append(("Ult initial raw damage".localizedString(), calculator.ultInitialRawDamage.string()))
        
        result.append(("Ult total raw damage".localizedString(), calculator.ultTotalRawDamage.string()))
        
        return result

    }
}
