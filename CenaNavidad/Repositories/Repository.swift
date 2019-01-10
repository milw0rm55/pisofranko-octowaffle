//
//  Repository.swift
//  CenaNavidad
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 9/1/19.
//  Copyright © 2019 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import Foundation
protocol Repository {
    associatedtype T
    func getAll() -> [T]
    func get (identifier: String) -> T?
    func create(a: T) -> Bool
    func update (a: T) -> Bool
    func delete (a: T) -> Bool
}

