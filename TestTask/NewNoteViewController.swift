//
//  NewNoteViewController.swift
//  TestTask
//
//  Created by Байсангур on 14.03.2022.
//

import UIKit

class NewNoteViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
       
    }
    
    // MARK: Table view deligate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}

// MARK: Text field deligate

extension NewNoteViewController: UITextFieldDelegate {

//    Скрываем клавиатуру при нажатии Done

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
