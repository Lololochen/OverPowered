//
//  Hero.swift
//  Overpower
//
//  Created by Bright Future on 10/09/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

class LocalHero: Selectable {
    
    let name: String
    let image: UIImage
    
    init (name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    static let adagio = LocalHero(name: "Adagio", image: #imageLiteral(resourceName: "adagio"))
    static let alpha = LocalHero(name: "Alpha", image: #imageLiteral(resourceName: "alpha"))
    static let ardan = LocalHero(name: "Ardan", image: #imageLiteral(resourceName: "ardan"))
    static let baptiste = LocalHero(name: "Baptiste", image: #imageLiteral(resourceName: "baptiste"))
    static let baron = LocalHero(name: "Baron", image: #imageLiteral(resourceName: "baron"))
    static let blackfeather = LocalHero(name: "Blackfeather", image: #imageLiteral(resourceName: "blackfeather"))
    static let catherine = LocalHero(name: "Catherine", image: #imageLiteral(resourceName: "catherine"))
    static let celeste = LocalHero(name: "Celeste", image: #imageLiteral(resourceName: "celeste"))
    static let flicker = LocalHero(name: "Flicker", image: #imageLiteral(resourceName: "flicker"))
    static let fortress = LocalHero(name: "Fortress", image: #imageLiteral(resourceName: "fortress"))
    static let grace = LocalHero(name: "Grace", image: #imageLiteral(resourceName: "grace"))
    static let grumpjaw = LocalHero(name: "Grumpjaw", image: #imageLiteral(resourceName: "grumpjaw"))
    static let glaive = LocalHero(name: "Glaive", image: #imageLiteral(resourceName: "glaive"))
    static let gwen = LocalHero(name: "Gwen", image: #imageLiteral(resourceName: "gwen"))
    static let idris = LocalHero(name: "Idris", image: #imageLiteral(resourceName: "idris"))
    static let joule = LocalHero(name: "Joule", image: #imageLiteral(resourceName: "joule"))
    static let kestrel = LocalHero(name: "Kestrel", image: #imageLiteral(resourceName: "kestrel"))
    static let koshka = LocalHero(name: "Koshka", image: #imageLiteral(resourceName: "koshka"))
    static let krul = LocalHero(name: "Krul", image: #imageLiteral(resourceName: "krul"))
    static let lance = LocalHero(name: "Lance", image: #imageLiteral(resourceName: "lance"))
    static let lyra = LocalHero(name: "Lyra", image: #imageLiteral(resourceName: "lyra"))
    static let ozo = LocalHero(name: "Ozo", image: #imageLiteral(resourceName: "ozo"))
    static let petal = LocalHero(name: "Petal", image: #imageLiteral(resourceName: "petal"))
    static let phinn = LocalHero(name: "Phinn", image: #imageLiteral(resourceName: "phinn"))
    static let reim = LocalHero(name: "Reim", image: #imageLiteral(resourceName: "reim"))
    static let reza = LocalHero(name: "Reza", image: #imageLiteral(resourceName: "reza"))
    static let ringo = LocalHero(name: "Ringo", image: #imageLiteral(resourceName: "ringo"))
    static let rona = LocalHero(name: "Rona", image: #imageLiteral(resourceName: "rona"))
    static let samuel = LocalHero(name: "Samuel", image: #imageLiteral(resourceName: "samuel"))
    static let saw = LocalHero(name: "Saw", image: #imageLiteral(resourceName: "saw"))
    static let skaarf = LocalHero(name: "Skaarf", image: #imageLiteral(resourceName: "skaarf"))
    static let skye = LocalHero(name: "Skye", image: #imageLiteral(resourceName: "skye"))
    static let taka = LocalHero(name: "Taka", image: #imageLiteral(resourceName: "taka"))
    static let vox = LocalHero(name: "Vox", image: #imageLiteral(resourceName: "vox"))
    
    static let allHeroes = [adagio, alpha, ardan, baptiste, baron, blackfeather, catherine, celeste, flicker, fortress, glaive, grace, grumpjaw, gwen, idris, joule, kestrel, koshka, krul, lance, lyra, ozo, petal, phinn, reim, reza, ringo, rona, samuel, saw, skaarf, skye, taka, vox]
}

