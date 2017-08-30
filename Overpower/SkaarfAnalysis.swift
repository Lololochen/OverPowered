//
//  SkaarfAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class SkaarfAnalysis: AbilityAnalysis {
    
    var calculator: Skaarf {
        return Skaarf(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability raw damage".localizedString(), calculator.aAbilityRawDamage.string()))
        
        result.append(("A ability with basic attacks max raw crystal DPS".localizedString(), calculator.aAbilityWithBasicAttacksMaxRawCrystalDPS.string()))
        
        result.append(("B ability ignite raw damage".localizedString(), calculator.bAbilityIgniteRawDamage.string()))
        
        result.append(("Burning raw DPS".localizedString(), calculator.bAbilityBurnRawDPS.string()))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult raw DPS".localizedString(), calculator.ultRawDPS.string()))
        
        return result

    }
}
