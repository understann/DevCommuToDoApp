//
//  DataItem.swift
//  DevCommuToDoApp
//
//  Created by Nattapon Howong on 22/5/2567 BE.
//

import Foundation
import SwiftData

@Model
class DataItem {
    var name: String
    var isCheck: Bool = false 
    var dueDate: Date

  init(name: String = "", dueDate: Date = Date.now) {
        self.name = name
        self.dueDate = dueDate
    }
}
