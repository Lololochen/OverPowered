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

        result.append(("A ability 4 shots raw weapon damage".localizedString(), calculator.fourShotsRawWeaponDamage.string()))
        
        result.append(("A ability 4 shots raw crystal damage".localizedString(), calculator.fourShotsRawCrystalDamage.string()))
        
        result.append(("A ability with basic attacks raw weapon DPS".localizedString(), calculator.glimmerShotWithBasicAttacksRawWeaponDPS.string()))
        
        result.append(("A ability with basic attacks raw crystal DPS".localizedString(), calculator.glimmerShotWithBasicAttacksRawCrystalDPS.string()))
        
        result.append(("Reload time".localizedString(), roundedString(calculator.aAbilityReloadTime)))
        
        result.append(("B ability raw damage".localizedString(), calculator.bAbilityRawDamage.string()))
        
        result.append(("B ability stealth duration".localizedString(), roundedString(calculator.bAbilityStealthDuration)))
        
        result.append(("Mist duration".localizedString(), roundedString((calculator.bAbilityMistDuration))))
        
        result.append(("Speed boost".localizedString(), roundedString(calculator.bAbilityMoveSpeedIncrease)))
        
        result.append(("Ult raw weapon damage".localizedString(), calculator.ultRawWeaponDamage.string()))
        
        result.append(("Ult raw crystal damage".localizedString(), calculator.ultRawCrystalDamage.string()))
        
        return result
    }
}
