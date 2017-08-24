//
//  KestrelAnalysis.swift
//  OverPowered
//
//  Created by Bright Future on 07/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class KestrelAnalysis: AbilityAnalysis {
    
    var calculator: Kestrel {
        return Kestrel(dataSource: dataSource)
    }
    
    func analyze() -> [(String, String)] {
        
        result.append(contentsOf: genericInfo())

        let glimmerShotDamage = calculator.aAbilityDamage
        result.append(("Glimmer Shot damage".localizedString(), glimmerShotDamage.string()))
        
        if dataSource.attacker.buildPower.build.contains(Item.tensionBow) {
            let damageWithTensionBow = calculator.aAbilityDamageWithTensionBow
            result.append(("Damage with Tension Bow".localizedString(), damageWithTensionBow.string()))
        }
        
        var fourShotsDamage: Double {
            if dataSource.attacker.buildPower.build.contains(Item.tensionBow) {
                return calculator.aAbilityDamageWithTensionBow + glimmerShotDamage * 3
            } else {
                return glimmerShotDamage * 4
            }
        }
        result.append(("4 Glimmer Shots".localizedString(), fourShotsDamage.string()))
        
        let a = fourShotsDamage + calculator.aAbilityBasicAttackDamage
        result.append(("4 Glimmer Shots with 4 basic attacks damage".localizedString(), a.string()))
        
        let longRangeDamage = calculator.aAbilitySplashDamage
        result.append(("Splash damage".localizedString(), longRangeDamage.string()))
        
        let dps = fourShotsDamage / 2.4
        result.append(("Glimmer Shot DPS".localizedString(), dps.string()))
        
        let mixedDPS = (fourShotsDamage + calculator.aAbilityBasicAttackDamage * 4) / 3.6
        result.append(("Glimmer Shot with basic attack DPS".localizedString(), mixedDPS.string()))
        
        let reloadTime = calculator.aAbilityReloadTime
        result.append(("Reload time".localizedString(), roundedString(reloadTime)))
        
        let stealthDuration = calculator.bAbilityStealthDuration
        result.append(("B ability stealth duration".localizedString(), roundedString(stealthDuration)))
        
        let mistDamageWithBasicAttack = calculator.bAbilityDamage + calculator.aAbilityBasicAttackDamage
        result.append(("Mist damage with basic attack".localizedString(), mistDamageWithBasicAttack.string()))
        
        let mistDamageWithGlimmerShot = calculator.bAbilityDamage + glimmerShotDamage
        result.append(("Mist damage with glimmer shot".localizedString(), mistDamageWithGlimmerShot.string()))
        
        let mistDuration = calculator.bAbilityMistDuration
        result.append(("Mist duration".localizedString(), roundedString(mistDuration)))
        
        let moveSpeedIncrease = calculator.bAbilityMoveSpeedIncrease
        result.append(("Move speed increase".localizedString(), roundedString(moveSpeedIncrease)))
        
        let bAbilityCooldown = calculator.bAbilityCooldown
        result.append(("B ability cooldown".localizedString(), roundedString(bAbilityCooldown)))
        
        let ultDamage = calculator.ultDamage
        result.append(("Ult damage".localizedString(), ultDamage.string()))
        
        let ultOnMist = ultDamage + calculator.bAbilityDamage
        result.append(("Ult on mist damage".localizedString(), ultOnMist.string()))
        
        let ultCooldown = calculator.ultCooldown
        result.append(("Ult cooldown".localizedString(), ultCooldown.string()))
        
        return result
    }
}
