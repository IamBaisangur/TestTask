//
//  ModelForNote.swift
//  TestTask
//
//  Created by Байсангур on 14.03.2022.
//

import UIKit

struct Note {
    
    var noteImages: String?
    var image: UIImage?
    var name: String
    var typeNote: String?
    var deadline: String?
    
    static let notesName = ["notesName"]
    
    static func getNotes() -> [Note] {
        
        var notes = [Note]()
        
        for note in notesName {
            notes.append(Note(noteImages: note, image: nil, name: note, typeNote: "Тестовое задание", deadline: "27.03.2022"))
        }
        
        return notes
    }
}
