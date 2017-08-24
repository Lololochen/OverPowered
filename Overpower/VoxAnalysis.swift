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

        let a = calculator.dpsWithAAbility
        result.append(("Basic attacks DPS with A ability".localizedString(), a.string()))
        
        let b = calculator.bounceDPS
        result.append(("Resonance bounce DPS".localizedString(), b.string()))
        
        let f = calculator.aAbilityCooldown
        result.append(("A ability cooldown".localizedString(), roundedString(f)))
        
        let c = calculator.bAbilitySlowAtCenter
        result.append(("B ability slow at center".localizedString(), percentageString(c)))
        
        let d = calculator.bAbilitySlowAtEdge
        result.append(("Slow on the edge".localizedString(), percentageString(d)))
        
        let e = calculator.bAbilityCooldown
        result.append(("Cooldown".localizedString(), roundedString(e)))
        
        let g = calculator.ultInitialDamage
        result.append(("Ult initial damage".localizedString(), g.string()))
        
        let h = calculator.ultTotalDamage
        result.append(("Ult total damage".localizedString(), h.string()))
        
        return result

    }
}
