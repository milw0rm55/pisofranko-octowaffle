//
//  Entity.swift
//  CenaNavidad
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 9/1/19.
//  Copyright © 2019 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import Foundation
import RealmSwift

class Entity: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var isDone = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    convenience init (people: Participantes)
    {
        self.init()
        self.id = people.id
        self.name = people.name
        self.isDone = people.isDone
    }
    func taskModel() -> Participantes{
        let model = Participantes()
        model.id = self.id
        model.name = self.name
        model.isDone = self.isDone
        return model
    }
}
