//
//  Category.swift
//  Todoey
//
//  Created by 李茜 on 10/9/23.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
