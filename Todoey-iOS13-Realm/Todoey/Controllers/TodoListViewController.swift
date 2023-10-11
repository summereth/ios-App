//
//  ViewController.swift
//  Todoey
//
//  Created by 李茜 on 10/7/23.
//

import UIKit
import RealmSwift

class TodoListViewController: SwipeTableViewController {
    
    var toDoItems: Results<Item>?
    let realm = try! Realm()
    var selectedCategory: Category? {
        didSet{
            // Those codes will be excuted whenever the value of this variable is set
            loadItems()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The following code also works if we don't have didSet for the variable selectedCategory
        // loadItems()
        
    }
    
    // MARK: - Add new items
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { alertAction in
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving new items, \(error)")
                }
            }
            self.tableView.reloadData()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create an item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true)
        
    }

    
    // MARK: - Data manipulation methods
    
    func loadItems() {
        toDoItems = selectedCategory?.items.sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }
    
    override func deleteObjectFromModel(at indexPath: IndexPath) {
        
        if let item = toDoItems?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(item)
                }
            } catch {
                print("Error when deleting item: \(error)")
            }
        }
        
    }
    
    // MARK: - Tableview datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = toDoItems?[indexPath.row]
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = item?.title
        cell.accessoryType = item?.done ?? false ? .checkmark : .none
        
        return cell
    }

    // MARK: - TableView delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])

        //var item = itemArray[indexPath.row]. We can't use this. Coz when we change item.done, it won't change the original item

//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
        
        if let item = toDoItems?[indexPath.row] {
            do {
                try realm.write{
                    // realm.delete(item)
                    item.done = !item.done
                }
            } catch {
                print("Error saving done status, \(error)")
            }
        }
                
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


//MARK: - SearchBar delegate methods
extension TodoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        toDoItems = toDoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text?.count == 0) {
            loadItems()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
