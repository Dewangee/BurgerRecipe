//
//  RecipeListViewController.swift
//  BurgerRecipe
//
//  Created by Dewangee Agrawal on 12/09/20.
//  Copyright © 2020 Dewangee Aggarwal. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model = BurgerModel()
    
    var selectedType : BurgerType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let burger = model.burgers[indexPath.row]
                let detailVC = segue.destination as? RecipeDetailViewController
                detailVC?.burger = burger
            } 
        }
        else if segue.identifier == "addRecipe" {
            let navVC = segue.destination as? UINavigationController
            let addVC = navVC?.viewControllers.first as? AddRecipeViewController
            addVC?.delegate = self
        }
    }
    
    @IBAction func didChangeConnect(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedType = nil
        case 1:
            selectedType = .meat
        case 2:
            selectedType = .vegetarian
        default:
            break
        }
        
        tableView.reloadData()
    }
}

extension RecipeListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.burgers(forType: selectedType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BurgerCell", for: indexPath) as! RecipeTableViewCell
        let burger = model.burgers(forType: selectedType)[indexPath.row]
        
        cell.nameLabel.text = burger.name
        cell.ingredientsLabel.text = burger.ingredients
        cell.thumbnailImageView.image = UIImage(named: burger.thumbnailName)
        
        return cell
    }
}

extension RecipeListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RecipeListViewController : AddRecipeDelegate {
    func add(burger: Burger) {
        model.add(burger:burger)
        tableView.reloadData()
    }
}
