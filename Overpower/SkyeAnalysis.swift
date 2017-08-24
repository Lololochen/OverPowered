//
//  SkyeAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class SkyeAnalysis: AbilityAnalysis {
    
    var calculator: Skye {
        return Skye(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        result.append(("A ability DPS".localizedString(), calculator.aAbilityLockOnDPS.string()))
        
        result.append(("DPS without lock on bonus".localizedString(), calculator.aAbilityDps.string()))
        
        result.append(("Slow strength".localizedString(), percentageString(calculator.aAbilitySlowStrength)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.aAbilityCooldown)))
        
        result.append(("B ability damage".localizedString(), calculator.bAbilityDamage.string()))
        
        result.append(("Cooldown reset on Forward Barrage".localizedString(), percentageString(calculator.bAbilityCooldownReset)))
        
        result.append(("Target Lock duration bonus".localizedString(), roundedString(calculator.bAbilityTargetLockDurationBonus)))
        
        result.append(("Target Lock duration".localizedString(), roundedString(calculator.bAbilityTargetLockDurationBonus + 3)))
        
        result.append(("Cooldown".localizedString(), roundedString(calculator.bAbilityCooldown)))
        
        result.append(("Ult damage".localizedString(), calculator.ultDamage.string()))
        
        result.append(("Slow strength".localizedString(), percentageString(calculator.ultSlowStrength)))
        
        result.append(("Target Lock range bonus".localizedString(), roundedString(calculator.ultTargetLockRangeBonus)))
        
        result.append(("Target Lock range".localizedString(), roundedString(8.5 + calculator.ultTargetLockRangeBonus)))
        
        result.append(("Cooldown".localizedString(), calculator.ultCooldown.string()))
        
        return result
    }
}
