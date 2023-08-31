//
//  ViewController.swift
//  ToDoApp
//
//  Created by Shreeram Bhat on 31/08/23.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var todoSegmentedControl: UISegmentedControl!
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    private var todoTasks: [TodoTaskModel] = []
    private var filteredTodoTasks: [TodoTaskModel] = []
    private var highTaskCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Todo"
    }

    @IBAction func didTapOnAddButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addTodoVC = storyBoard.instantiateViewController(withIdentifier: String(describing: AddTodoTaskViewController.self)) as! AddTodoTaskViewController
        addTodoVC.didAddTodoTask = { todoModel in
            
//            switch todoModel.priority {
//            case .high:
//            }
            
            self.todoTasks.append(todoModel)
            self.todoTasks.sort { $0.priority.rawValue > $1.priority.rawValue }
            self.filteredTodoTasks = self.todoTasks.filter( { $0.isDone } )
            
            self.toDoTableView.reloadData()
            
            self.navigationController?.popViewController(animated: true)
        }
        
        self.navigationController?.pushViewController(addTodoVC, animated: true)
    }
    
    @IBAction func didChangeTodoSegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
        } else {
            
        }
    }
    
}

extension TodoListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TodoTableViewCell.self), for: indexPath) as! TodoTableViewCell
        let todoModel = self.todoTasks[indexPath.row]
        cell.configureCell(title: todoModel.title, description: todoModel.description ?? "")
        
        return cell
    }
    
}
