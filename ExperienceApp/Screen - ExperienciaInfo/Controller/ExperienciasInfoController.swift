//
//  ExperienciasInfoController.swift
//  ExperienceApp
//
//  Created by Juliana Vigato Pavan on 15/05/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

struct UserResponsavel {
    let image: Data
    let name: String
    let description: String
}

protocol ExperienciasInfoControllerDelegate: AnyObject {
    func reloadData(data: ModelExperienciasInfo, responsible: UserResponsavel?)
}

final class ExperienciasInfoController {
    public var dataToConvert: MainModel
    public var data: ModelExperienciasInfo
    
    weak public var delegate: ExperienciasInfoControllerDelegate?
    
    public init() {
        self.data = ModelExperienciasInfo(infoImage: UIImage(named: "Fire_Demon_Ramen")!, titleExp: "Pandas fofos comendo bambu",durationTime: 3, howManyPeople: 5, tags: ["lala"],
        descriptionExp: "Venha conhecer os pandas mais fofos que voce vera na sua vida! Eles comem bambu e sao felizes.",
        hostImage: UIImage(named: "Fire_Demon_Ramen")!, hostName: "Merida Valente", hostDescription: "Eu sou Merida, princesa de um reino distante e gosto de ursos!",
        howParticipate: "zoom é o caminho", whatYouNeedDescription: "Amor no coracao", recordName: "", responsible: "", data: "")
        self.dataToConvert = MainModel(nomeDestaque: "", nomeExp: "", descricaoExp: "", notaExp: 0, precoExp: "", recordName: "", image: Data(), recursos: "", comoParticipar: "", tamanho: 0, responsible: "", data: "")
    }
    
    public func reload() {
        guard let image = UIImage(data: dataToConvert.image ?? Data()) else { return }
        guard let tamanho = dataToConvert.tamanho else { return }
        guard let participar = dataToConvert.comoParticipar else { return }
        guard let recursos = dataToConvert.recursos else { return }
        guard let data = dataToConvert.data else { return }
        let newData = ModelExperienciasInfo(infoImage: image, titleExp: dataToConvert.nomeExp, durationTime: 0, howManyPeople: tamanho, tags: [], descriptionExp: dataToConvert.descricaoExp, hostImage: image, hostName: ""
            , hostDescription: "", howParticipate: participar, whatYouNeedDescription: recursos, recordName: dataToConvert.recordName, responsible: dataToConvert.responsible ?? "", data: data, available: dataToConvert.available)
        self.data = newData
        self.delegate?.reloadData(data: self.data, responsible: nil)
        
        Cloud.shared.getUserResponsible(user: self.data.responsible) { (responsibleData, erros) in
            if let responsibleData = responsibleData {
                if let responsibleUser = responsibleData as? CKRecord {
                    if let image = responsibleUser["image"] {
                        guard let file: CKAsset? = image as? CKAsset else { return }
                        if let file = file {
                            let dado = NSData(contentsOf: file.fileURL!)
                            let responsible = UserResponsavel(image: dado as? Data ?? Data(), name: responsibleData["name"] ?? "", description: responsibleData["description"] ?? "")
                            self.delegate?.reloadData(data: self.data, responsible: responsible)
                        }
                    }
                }
            }
        }
    }

    public func attach(recordName: String) {
        Cloud.shared.attachExperience(data: ExperienceModel(title: "", description: "", recordName: recordName, date: Date(), howToParticipate: "", lengthGroup: Int64(0), whatToTake: "", image: ""))
    }

    public func desattach(recordName: String) {
        Cloud.shared.desattachExperience(data: ExperienceModel(title: "", description: "", recordName: recordName, date: Date(), howToParticipate: "", lengthGroup: Int64(0), whatToTake: "", image: ""))
    }
}
