//
//  AddRecipeViewController.swift
//  BurgerRecipe
//
//  Created by Dewangee Agrawal on 27/09/20.
//  Copyright © 2020 Dewangee Aggarwal. All rights reserved.
//

import UIKit

protocol AddRecipeDelegate {
    func add(burger:Burger)
}

class AddRecipeViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    let ingredientsPlaceholder = "Add Ingredients"
    
    var delegate : AddRecipeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsTextView.delegate = self
        ingredientsTextView.text = ingredientsPlaceholder
    }
    

    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func didTapSave(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        let newBurger = Burger(name: name, ingredients:  ingredientsTextView.text, imageName: "", thumbnailName: "", type: .vegetarian)
        delegate?.add(burger:newBurger)
        dismiss(animated: true)
    }
}

extension AddRecipeViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.tertiaryLabel {
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = ingredientsPlaceholder
            textView.textColor = UIColor.tertiaryLabel
        }
    }
}

