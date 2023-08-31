//
//  AddTodoTaskViewController.swift
//  ToDoApp
//
//  Created by Shreeram Bhat on 31/08/23.
//

import UIKit

class AddTodoTaskViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var prirotyLabel: UILabel!
    @IBOutlet weak var prirotySegmentedControl: UISegmentedControl!
    @IBOutlet weak var addButton: UIButton!
    
    var didAddTodoTask: ((TodoTaskModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Todo"
        self.prirotySegmentedControl.selectedSegmentIndex = 1
    }
    
    @IBAction func didTapOnAddButton(_ sender: UIButton) {
        guard let title = self.titleTextField.text, !title.isEmpty else { return }
        let description = self.descriptionTextField.text
        
        var priority: Priority = .medium
        switch self.prirotySegmentedControl.selectedSegmentIndex {
        case 0:
            priority = .high
        case 1:
            priority = .medium
        case 2:
            priority = .low
        default:
            priority = .medium
        }
        
        let todoTaskModel = TodoTaskModel(title: title, description: description, priority: priority, isDone: false)
        self.didAddTodoTask?(todoTaskModel)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
