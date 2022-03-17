//
//  NewNoteViewController.swift
//  TestTask
//
//  Created by Байсангур on 14.03.2022.
//

import UIKit

class NewNoteViewController: UITableViewController {
    
    var newNote: Note?
    var imageIsChanged = false

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var noteImage: UIImageView!
    
    @IBOutlet weak var noteName: UITextField!
    @IBOutlet weak var typeNote: UITextField!
    @IBOutlet weak var dateOfCompletion: UITextField!
    @IBOutlet weak var countSymbol: UILabel!
    @IBOutlet weak var contentNote: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        saveButton.isEnabled = false
        noteName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        contentNote.delegate = self
        
        contentNote.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        contentNote.backgroundColor = self.view.backgroundColor
        contentNote.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateContentNote(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateContentNote(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
       
    }
    
    // MARK: Table view deligate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true) // Скрытие клавиатуры вызванной для любого обьекта
    }
    
    
    func saveNewNote() {
        
        var image: UIImage?
        
        if imageIsChanged {
            image = noteImage.image
        } else {
            image = UIImage(named: "ImageDefault")
        }
        
        newNote = Note(noteImages: nil,
                       image: image,
                       name: noteName.text!,
                       typeNote: typeNote.text,
                       deadline: dateOfCompletion.text)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @objc func updateContentNote(notification: Notification ) {

//        guard let userInfo = notification.userInfo as? [String: Any],
//              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//              else { return }

        if notification.name == UIResponder.keyboardWillHideNotification {
            contentNote.contentInset = UIEdgeInsets.zero
        } else {
            contentNote.contentInset = UIEdgeInsets(top: 0,
                                                    left: 0,
                                                    bottom: 20, // keyboardFrame.height - contentNoteButtomConstraint.constant,
                                                    right: 0)
            contentNote.scrollIndicatorInsets = contentNote.contentInset
        }

        contentNote.scrollRangeToVisible(contentNote.selectedRange)
    }
    
    
    
    
}

    // MARK: Text field deligate

extension NewNoteViewController: UITextFieldDelegate {

//    Скрываем клавиатуру при нажатии Done

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        
        if noteName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}


    // MARK: Work with image

extension NewNoteViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        noteImage.image = info[.editedImage] as? UIImage
        noteImage.contentMode = .scaleAspectFill
        noteImage.clipsToBounds = true
        
        imageIsChanged = true
        dismiss(animated: true)
    }
}


    // MARK: Text view deligate

extension NewNoteViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        contentNote.backgroundColor = .white
        contentNote.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        contentNote.backgroundColor = self.view.backgroundColor
        contentNote.textColor = .black
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countSymbol.text = "\(contentNote.text.count )"
        return contentNote.text.count + (text.count - range.length) <= 1000
    }
}
