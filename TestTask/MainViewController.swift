//
//  MainViewController.swift
//  TestTask
//
//  Created by Байсангур on 12.03.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    var notes = Note.getNotes()

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        let separateNote = notes[indexPath.row]
        
        cell.nameLabel.text = separateNote.name
        cell.typeTaskLabel.text = separateNote.typeNote
        cell.deadlineLabel.text = separateNote.deadline
        cell.nameLabel.text = separateNote.name
        
        if separateNote.image == nil {
            cell.imageOfNote.image = UIImage(named: separateNote.noteImages!)
        } else {
            cell.imageOfNote.image = separateNote.image
        }
        
        cell.imageOfNote.layer.cornerRadius = cell.imageOfNote.frame.size.height / 2
        cell.imageOfNote.clipsToBounds = true
        
        return cell 
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newNoteVC = segue.source as? NewNoteViewController else { return }
        
        newNoteVC.saveNewNote()
        notes.append(newNoteVC.newNote!)
        tableView.reloadData()
    }

}
