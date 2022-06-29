//
//  ViewController.swift
//  TodoLIst
//
//  Created by Caio Thomaz Nogueira  on 22/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
@IBOutlet weak var tableView: UITableView!
    
    var allItems = [TodoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  Do any additional setup after loading the view.
        self.tableView.dataSource = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        
        // da dados para as celulas
        //TodoListCell = identificador da celular/nome atruibuida a ela
        
        let cell = tableView.dequeueReusableCell( withIdentifier: "TodoListCell" , for: indexPath as IndexPath ) as UITableViewCell
        
        let currentTodo = allItems[indexPath.row]
        
        cell.textLabel?.text = currentTodo.title
        cell.detailTextLabel?.text = currentTodo.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allItems.count
    }
    
    @IBAction func addNewTodoListItem(_ sender: UIBarButtonItem) {
     
        var newTodoListItem : TodoItem!
        
        var alert = UIAlertController(title:"New Todo Item", message: "please entre a title and details for the new to do list item ", preferredStyle: UIAlertController.Style.alert)
        
        var createItemAction = UIAlertAction(title: "Create", style: UIAlertAction.Style.default){
            (UIAlertAction) -> Void in
            
             let itemTitle = alert.textFields![0] as UITextField
            let itemDetail = alert.textFields![1] as UITextField
            
            newTodoListItem = TodoItem(newTitle: itemTitle.text, withText: itemDetail.text)
            
            self.allItems.append(newTodoListItem)
            
            self.tableView.reloadData()
            
        }
        var createCancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
       
        alert.addTextField{(textField)-> Void in
            textField.placeholder = "Title"
        }
        
        alert.addTextField{(textField)-> Void in
            textField.placeholder = "Details"
            //coloca o campo como senha\ sem mostrar oq esra escrito
            //textField.isSecureTextEntry = true
        }
        
        alert.addAction(createItemAction)
        alert.addAction(createCancelAction)
        
        self.present(alert, animated: true, completion: nil)
        }
 }


                           
