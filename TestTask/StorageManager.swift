//
//  StorageManager.swift
//  TestTask
//
//  Created by Байсангур on 18.03.2022.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ note: Note) {
        
        try! realm.write {
            realm.add(note)
        }
    }
    
    static func deleteObject(_ note: Note){
        
        try! realm.write {
            realm.delete(note)
        }
    }
}
