//
//  MainController.swift
//  ExperienceApp
//
//  Created by Juliana Vigato Pavan on 15/05/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import Foundation

protocol MainControllerDelegate: AnyObject {
    func reloadData(data: MainModel)
}

final class MainController {
    private var data: [MainModel] = []
    weak public var delegate: MainControllerDelegate?
    
    public init() {
        //self.data.append
        
    }
    
    public func reload() {
        delegate?.reloadData(data: data)
    }
}
