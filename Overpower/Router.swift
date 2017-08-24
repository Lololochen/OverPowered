//
//  Router.swift
//  OverPowered
//
//  Created by Bright Future on 03/04/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import Foundation

class Router {
    
    static let shared = Router()
    var dataSource: DataSource!
    var returnData = [IncomingData]()
    var questionsAnswered = [String : Bool]()
    
    func post(data: OutGoingData)  -> [IncomingData] {
        returnData = []
        
        switch data.name {
            
        case "LAUNCH":
            dataSource = DataSource()
            launchConversation()
            
        case "ATTACKER HERO":
            dataSource.attacker.heroPower.hero = Namable.matchSelectable(data.selectable!) as? Hero
            attackerHeroVariation()
            
        case "DEFENDER HERO":
            dataSource.defender.heroPower.hero = Namable.matchSelectable(data.selectable!) as? Hero
            defenderHeroVariation()
            
        case "ATTACKER LEVEL":
            dataSource.attackerLevel = data.number!
            
        case "DEFENDER LEVEL":
            dataSource.defenderLevel = data.number!
            
        case "ATTACKER BUILD":
            addItem(itemName: data.selectable!, player: dataSource.attacker)
            if let item = Namable.matchSelectable(data.selectable!) as? Item {
                attackerBuildVariation(of: item)
            }
            
        case "DEFENDER BUILD":
            addItem(itemName: data.selectable!, player: dataSource.defender)
            
        case "DELETE ATTACKER BUILD":
            let item = Namable.matchSelectable(data.selectable!)
            dataSource.attacker.buildPower.build = dataSource.attacker.buildPower.build.filter( { $0 != item } )
            
        case "DELETE DEFENDER BUILD":
            let item = Namable.matchSelectable(data.selectable!)
            dataSource.defender.buildPower.build = dataSource.attacker.buildPower.build.filter( { $0 != item } )
            
        case "BREAKING POINT STACK":
            dataSource.attacker.buildPower.breakingPointStack = data.number!
            questionsAnswered["BREAKING POINT STACK"] = true
            
        case "BONESAW STACK":
            dataSource.defender.armorShred = Double(data.number!) * 0.05
            questionsAnswered["BONESAW STACK"] = true
            
        case "BROKEN MYTH STACK":
            dataSource.attacker.buildPower.brokenMythStack = data.number!
            questionsAnswered["BROKEN MYTH STACK"] = true
            
        case "FIGHT DURATION":
            dataSource.attacker.fightDuration = Double(data.number!)
            questionsAnswered["FIGHT DURATION"] = true
            
        case "HEARTTHROB STACK":
            dataSource.attacker.heroPower.heartthrobStack = data.number!
            questionsAnswered["HEARTTHROB STACK"] = true
            
        case "KI STACK":
            dataSource.attacker.heroPower.kiStack = data.number!
            questionsAnswered["KI STACK"] = true
            
        case "LIVING ARMOR STACK":
            dataSource.defender.heroPower.livingArmorStack = data.number!
            questionsAnswered["LIVING ARMOR STACK"] = true
            
        case "CAPTAIN OF THE GUARD":
            dataSource.defender.heroPower.captainOfTheGuardStack = data.number!
            questionsAnswered["CAPTAIN OF THE GUARD"] = true
            
        case "A ABILITY TIER":
            dataSource.attacker.heroPower.aAbilityTier = data.number!
            questionsAnswered["A ABILITY TIER"] = true
            
        case "B ABILITY TIER":
            dataSource.attacker.heroPower.bAbilityTier = data.number!
            questionsAnswered["B ABILITY TIER"] = true
            
        case "ULT TIER":
            dataSource.attacker.heroPower.ultTier = data.number!
            questionsAnswered["ULT TIER"] = true
            
        default:
            fatalError()
        }
        
        return returnData
    }
    
    func attackerBuildVariation(of item: Item) {
        
        if item == Item.tensionBow {
            returnData.append(IncomingData(question: "Of every 6 seconds how many seconds are you attacking the enemy?".localizedString(), answerType: .textField(regex: "[0-6]"), answerIdentifier: "FIGHT DURATION"))
            questionsAnswered["FIGHT DURATION"] = false
        }
        
        if item == Item.breakingPoint {
            returnData.append(IncomingData(question: "What's the stack of Breaking Point?".localizedString(), answerType: .textField(regex: "([0-9]|1[0-9]|20)"), answerIdentifier: "BREAKING POINT STACK"))
            questionsAnswered["BREAKING POINT STACK"] = false
        }
        
        if item == Item.bonesaw {
            returnData.append(IncomingData(question: "What's the stack of Bonesaw?".localizedString(), answerType: .textField(regex: "[0-8]"), answerIdentifier: "BONESAW STACK"))
            questionsAnswered["BONESAW STACK"] = false
        }
        
        if item == Item.brokenMyth {
            returnData.append(IncomingData(question: "What's the stack of Broken Myth?".localizedString(), answerType: .textField(regex: "[0-9]"), answerIdentifier: "BROKEN MYTH STACK"))
            questionsAnswered["BROKEN MYTH STACK"] = false
        }
        return
    }
    
    func launchConversation() {
        
        returnData.append(IncomingData(question: "Please select your hero".localizedString(), answerType: .button, answerIdentifier: "ATTACKER HERO"))
        
        returnData.append( IncomingData(question: "What's your hero's level?".localizedString(), answerType: .textField(regex: "1?[0-9]"), answerIdentifier: "ATTACKER LEVEL") )
        
        returnData.append( IncomingData(question: "What's your build?".localizedString(), answerType: .selectBuildView, answerIdentifier: "ATTACKER BUILD") )
        
        returnData.append(IncomingData(question: "What's the enemy hero?".localizedString(), answerType: .button, answerIdentifier: "DEFENDER HERO"))
        
        returnData.append( IncomingData(question: "What's the enemy hero's level?".localizedString(), answerType: .textField(regex: "1?[0-9]"), answerIdentifier: "DEFENDER LEVEL") )
        
        returnData.append( IncomingData(question: "What's the enemy's build?".localizedString(), answerType: .selectBuildView, answerIdentifier: "DEFENDER BUILD") )
        
        askAbilityInfo()
    }
    
    func askAbilityInfo() {
        
        returnData.append( IncomingData(question: "What's A ability's tier?".localizedString(), answerType: .textField(regex: "[1-5]"), answerIdentifier: "A ABILITY TIER"))
        questionsAnswered["A ABILITY TIER"] = false
        
        returnData.append( IncomingData(question: "What's B ability's tier?".localizedString(), answerType: .textField(regex: "[1-5]"), answerIdentifier: "B ABILITY TIER"))
        questionsAnswered["B ABILITY TIER"] = false
        
        returnData.append( IncomingData(question: "What's Ult's tier?".localizedString(), answerType: .textField(regex: "[1-3]"), answerIdentifier: "ULT TIER"))
        questionsAnswered["ULT TIER"] = false
    }
    
    func defenderHeroVariation(){
        switch dataSource.defender.heroPower.hero! {
            
        case Hero.grumpjaw:
            returnData.append(IncomingData(question: "What's the Living Armor stack of Grumpjaw?".localizedString(),  answerType: .textField(regex: "[0-5]"), answerIdentifier: "LIVING ARMOR STACK"))
            questionsAnswered["LIVING ARMOR STACK"] = false
            
        case Hero.catherine:
            returnData.append(IncomingData(question: "How many Captain of the Guard stacks does Catherine have?".localizedString(), answerType: .textField(regex: "[0-9]+"), answerIdentifier: "CAPTAIN OF THE GUARD"))
            questionsAnswered["CAPTAIN OF THE GUARD"] = false
            
        default:
            return
        }
    }
    
    func attackerHeroVariation() {
        switch dataSource.attacker.heroPower.hero! {
            
        case Hero.blackfeather:
            returnData.append(IncomingData(question: "How many Heartthrob stacks does Blackfeather have?".localizedString(), answerType: .textField(regex: "[1-5]"), answerIdentifier: "HEARTTHROB STACK"))
            questionsAnswered["HEARTTHROB STACK"] = false
            
        case Hero.taka:
            returnData.append(IncomingData(question: "What's the Ki stack?".localizedString(), answerType: .textField(regex: "[1-5]"), answerIdentifier: "KI STACK"))
            questionsAnswered["KI STACK"] = false
            
        default:
            return
        }
    }
    
    func addItem(itemName: String, player: PlayerFightPower) {
        let item = Item.all.filter( { $0.name == itemName } )
        if item.count == 1 {
            player.buildPower.build.append(item[0])
            
        } else if itemName == "Weapon Infusion" {
            let infusion = Infusion(level: player.heroPower.level ?? 1, type: .weapon)
            player.buildPower.infusion = infusion
            
        } else if itemName == "Crystal Infusion" {
            let infusion = Infusion(level: player.heroPower.level ?? 1, type: .crystal)
            player.buildPower.infusion = infusion
        }
    }
    
    func getResult() -> [(String, String)] {
        guard dataSource.attacker.heroPower.hero != nil
            && dataSource.attacker.heroPower.level != nil
            && dataSource.defender.heroPower.hero != nil
            && dataSource.defender.heroPower.level != nil
            else { return []}
        
        for q in questionsAnswered {
            if q.value == false {
                return []
            }
        }
        
        return matchResult()
    }
    
    func matchResult() -> [(String, String)] {
        switch dataSource.attacker.heroPower.hero! {
        case Hero.adagio:
            return AdagioAnalysis(dataSource: dataSource).analyze()
        case Hero.alpha:
            return AlphaAnalysis(dataSource: dataSource).analyze()
        case Hero.ardan:
            return ArdanAnalysis(dataSource: dataSource).analyze()
        case Hero.baron:
            return BaronAnalysis(dataSource: dataSource).analyze()
        case Hero.blackfeather:
            return BlackfeatherAnalysis(dataSource: dataSource).analyze()
        case Hero.catherine:
            return CatherineAnalysis(dataSource: dataSource).analyze()
        case Hero.celeste:
            return CelesteAnalysis(dataSource: dataSource).analyze()
        case Hero.flicker:
            return FlickerAnalysis(dataSource: dataSource).analyze()
        case Hero.fortress:
            return FortressAnalysis(dataSource: dataSource).analyze()
        case Hero.glaive:
            return GlaiveAnalysis(dataSource: dataSource).analyze()
        case Hero.grumpjaw:
            return GrumpjawAnalysis(dataSource: dataSource).analyze()
        case Hero.gwen:
            return GwenAnalysis(dataSource: dataSource).analyze()
        case Hero.idris:
            return IdrisAnalysis(dataSource: dataSource).analyze()
        case Hero.joule:
            return JouleAnalysis(dataSource: dataSource).analyze()
        case Hero.kestrel:
            return KestrelAnalysis(dataSource: dataSource).analyze()
        case Hero.koshka:
            return KoshkaAnalysis(dataSource: dataSource).analyze()
        case Hero.krul:
            return KrulAnalysis(dataSource: dataSource).analyze()
        case Hero.lance:
            return LanceAnalysis(dataSource: dataSource).analyze()
        case Hero.lyra:
            return LyraAnalysis(dataSource: dataSource).analyze()
        case Hero.ozo:
            return OzoAnalysis(dataSource: dataSource).analyze()
        case Hero.petal:
            return PetalAnalysis(dataSource: dataSource).analyze()
        case Hero.phinn:
            return PhinnAnalysis(dataSource: dataSource).analyze()
        case Hero.reim:
            return ReimAnalysis(dataSource: dataSource).analyze()
        case Hero.ringo:
            return RingoAnalysis(dataSource: dataSource).analyze()
        case Hero.rona:
            return RonaAnalysis(dataSource: dataSource).analyze()
        case Hero.samuel:
            return SamuelAnalysis(dataSource: dataSource).analyze()
        case Hero.saw:
            return SawAnalysis(dataSource: dataSource).analyze()
        case Hero.skaarf:
            return SkaarfAnalysis(dataSource: dataSource).analyze()
        case Hero.skye:
            return SkyeAnalysis(dataSource: dataSource).analyze()
        case Hero.taka:
            return TakaAnalysis(dataSource: dataSource).analyze()
        case Hero.vox:
            return VoxAnalysis(dataSource: dataSource).analyze()
        case Hero.baptiste:
            return BaptisteAnalysis(dataSource: dataSource).analyze()
        case Hero.grace:
            return GraceAnalysis(dataSource: dataSource).analyze()
        case Hero.reza:
            return RezaAnalysis(dataSource: dataSource).analyze()
            
        default:
            fatalError()
        }
    }

}

