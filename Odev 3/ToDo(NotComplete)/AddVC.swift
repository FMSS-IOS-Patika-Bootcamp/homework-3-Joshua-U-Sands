//
//  AddVC.swift
//  Odev 3
//
//  Created by Joshua Sands on 25.09.2022.
//

import UIKit

class AddVC: UIViewController {

    var enteredTask:[String] = []
    
    @IBOutlet weak var taskField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapped)
    }
  @objc func hideKeyboard(){
      view.endEditing(true)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        if taskField.text != nil{
            enteredTask.append(taskField.text!)
        }
        
        let nextVc = storyboard?.instantiateViewController(withIdentifier: "listVC") as! ToDoVC
        nextVc.modalPresentationStyle = .fullScreen
        present(nextVc,animated: true)
    }
    
}
