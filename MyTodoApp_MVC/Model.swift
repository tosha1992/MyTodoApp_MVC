//
//  Model.swift
//  ToDoList on MVC
//
//  Created by Mariya Babenko on 12.02.2023.
//

import Foundation
import UIKit



//Создаем класс (описываем элемент строки)

class Item {
    var string: String
    var iscompleted: Bool

    
    init (string : String, iscompleted: Bool) {
        self.string = string
        self.iscompleted = iscompleted
       
    }
}

//Создаем модель

class Model {
   
    //Функия преобразования даты в строковое значеие
    func dateFormat (date: Date, format: String) -> String {
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = format
        let formatDate = dateFormatter.string(from: date)
        return formatDate
    }

   //Массив данных
    var myTasks: [Item] = [
        Item (string: "It's my first note" , iscompleted: true),
        Item (string: "My second note" , iscompleted: false)]
    
    //Функция активации нажатия
    
    func changeState (at Item: Int) -> Bool {
        myTasks[Item].iscompleted = !myTasks[Item].iscompleted
        return myTasks[Item].iscompleted
    }
    

    
//objc методы


}


