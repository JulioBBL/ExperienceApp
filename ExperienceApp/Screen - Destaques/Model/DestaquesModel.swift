//
//  DestaqueModel.swift
//  ExperienceApp
//
//  Created by Tamara Erlij on 20/05/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import Foundation
import UIKit

struct DestaquesModel {
    var nomeDestaque: String
    var descricaoDestaque: String
    var imgDestaque = String()
    
    public init(nomeDestaque: String, descricaoDestaque: String, imgDestaque: String) {
        self.nomeDestaque = nomeDestaque
        self.descricaoDestaque = descricaoDestaque
        self.imgDestaque = imgDestaque
    }
}

struct ExperienciaDestaquesModel {
    var tituloExp: String
    var imagemExp = UIImage()
    var descricaoExp: String
    
    public init(tituloExp: String, imagemExp: UIImage, descricaoExp: String) {
        self.tituloExp = tituloExp
        self.imagemExp = imagemExp
        self.descricaoExp = descricaoExp
    }
}
