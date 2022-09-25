//
//  ToDoVC.swift
//  Odev 3
//
//  Created by Joshua Sands on 25.09.2022.
//

import UIKit
import CoreData

class ToDoVC: UIViewController {

    @IBOutlet weak var toDoTable: UITableView!

    var tasks:[String] = []

    var currentIndex = Int()

    var isComplete = true

    override func viewDidLoad() {
        super.viewDidLoad()

        toDoTable.delegate = self
        toDoTable.dataSource = self

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(switchView))

        print(tasks)
        toDoTable.reloadData()
    }

    @objc func switchView(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "addBoard") as! AddVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)

    }
}
extension ToDoVC: UITableViewDelegate{

}

extension ToDoVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AddVC().enteredTask.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTable.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoCell

        if isComplete == true{
            cell.isCompleteImage.image = .checkmark
        }
        cell.taskLabel.text = AddVC().enteredTask[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailsVC") as! DetailsVC
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
        currentIndex = indexPath.row

    }
}
