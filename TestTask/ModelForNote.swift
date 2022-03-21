//
//  ModelForNote.swift
//  TestTask
//
//  Created by Байсангур on 14.03.2022.
//

import RealmSwift
import UIKit

class Note: Object {
    
    @objc dynamic var noteImages: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var name = ""
    @objc dynamic var typeNote: String?
    @objc dynamic var deadline: String?
    @objc dynamic var date = Date()
    
    convenience init(name: String, typeNote: String?, deadline: String?, imageData: Data?) {
        self.init()
        self.name = name
        self.typeNote = typeNote
        self.deadline = deadline
        self.imageData = imageData
    }
}
