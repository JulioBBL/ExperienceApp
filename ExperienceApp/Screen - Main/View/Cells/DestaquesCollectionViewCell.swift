//
//  DestaquesCollectionViewCell.swift
//  ExperienceApp
//
//  Created by Juliana Vigato Pavan on 15/05/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import UIKit

class DestaquesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var imgDestaque: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(model: MainModel) {
        self.lblTitulo.text = model.nomeDestaque
//        self.imgDestaque.image =
        self.backgroundColor = .white
        
    }
}

