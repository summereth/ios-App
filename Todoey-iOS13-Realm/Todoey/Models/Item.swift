//
//  Item.swift
//  Todoey
//
//  Created by 李茜 on 10/9/23.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    @objc dynamic var backgroundColor: String = ""
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
