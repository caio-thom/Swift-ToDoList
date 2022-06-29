 //
//  TodoItem.swift
//  TodoLIst
//
//  Created by Caio Thomaz Nogueira  on 22/06/22.
//
// mvc = model view controler
import Foundation

class TodoItem{
     
    var title : String!
    var text : String!
    
    init(newTitle : String, withText : String){
        self.title = newTitle
        self.text = withText
    }
}
