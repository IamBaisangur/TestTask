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
    @objc dynamic var contentNote: String?
    
//    let noteNames = ["newNote"]
//
//    func saveNotes() {
//
//        for note in noteNames {
//
//            let image = UIImage(named: note)
//            guard let imageData = image?.pngData() else { return }
//
//            let newNote = Note()
//
//            newNote.name = note
//            newNote.typeNote = "работа"
//            newNote.deadline = "27.03.2022"
//            newNote.imageData = imageData
//
//            StorageManager.saveObject(newNote)
//        }
//    }
    
    convenience init(name: String, typeNote: String?, deadline: String?, imageData: Data?, contentNote: String?) {
        self.init()
        self.name = name
        self.typeNote = typeNote
        self.deadline = deadline
        self.imageData = imageData
        self.contentNote = contentNote
    }
}
