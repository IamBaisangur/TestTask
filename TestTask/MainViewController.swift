//
//  MainViewController.swift
//  TestTask
//
//  Created by Байсангур on 12.03.2022.
//

import UIKit

class MainViewController: UITableViewController {
    let notesName = ["notesName"]

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.nameLabel.text = notesName[indexPath.row]
        cell.imageOfNote.image = UIImage(named: notesName[indexPath.row])
        cell.imageOfNote.layer.cornerRadius = cell.imageOfNote.frame.size.height / 2
        cell.imageOfNote.clipsToBounds = true
        
        return cell 
    }

    // MARK: - Table View deligate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {}

}
