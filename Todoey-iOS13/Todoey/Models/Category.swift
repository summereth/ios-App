//
//  Category.swift
//  Todoey
//
//  Created by 李茜 on 10/7/23.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    var items = List<Item>()
}
