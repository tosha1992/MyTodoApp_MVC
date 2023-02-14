//
//  ViewController.swift
//  MyTodoApp_MVC
//
//  Created by Mariya Babenko on 12.02.2023.
//

import UIKit

class ViewController: UITableViewController {
    
    
    let model = Model ()
  
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Добавляем вывод алерта на наш navigationitem
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNoteTap))
        

    }
    //Objc метод добавляющий алерт с текстовым плейсхолдером и добавляющий введенный в него текст в массив model
    
    @objc func addNoteTap () {
        
        let alert = UIAlertController (title: "Add note", message: "Wrote your task", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter your note"
        }
        
        alert.addAction (UIAlertAction(title: "Add note", style: .default, handler: {(action) in
            guard let textField = alert.textFields?.first else {return}
            guard let text = textField.text else {return}
            guard text != "" else {return}
            self .model .myTasks .append(Item(string: text, iscompleted: false))
            self .tableView .beginUpdates()
            let indexPath = IndexPath(row: self.model.myTasks.count-1, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .left)
            self.tableView.endUpdates()
        }))
        
        present(alert, animated: true)
        
}
// Переопределеямый метод количества строк в таблице. Берем их из нашей модели
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.myTasks.count
    }
    
    
 // Метод определяющий содердимое нашей ячейки
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell (style: .subtitle, reuseIdentifier: cellId)
        let currentItem = model.myTasks [indexPath.row]
        
        cell.textLabel?.text = currentItem.string
        cell.accessoryType = currentItem.iscompleted ? .checkmark: .none
        cell.detailTextLabel?.text = model.dateFormat(date: Date(), format: "H:mm / dd.MM.yyy")

        return cell
    }
    
    // Метод определения, есть ли выделение строки, будет ли галочка в конце строки
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if model.changeState(at: indexPath.row) == true {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }


}

