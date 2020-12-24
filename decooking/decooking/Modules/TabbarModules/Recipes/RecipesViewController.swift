//
//  RecipesViewController.swift
//  decooking
//
//  Created by Иван Морозов on 05.11.2020.
//

import TTGTagCollectionView
import TagListView
import UIKit

class RecipesViewController : UIViewController, TTGTextTagCollectionViewDelegate {
    private var recepiesView: RecipesView = RecipesView.loadXib()
    private var presenter: IRecipesPresenter
    private var interactor: IRecipesInteractor
    private let collectionView = TTGTextTagCollectionView()
        
    private var onAddTag: ((Ingredient) -> Void)?
    private var onSave: (() -> Void)?
    
    init(presenter: IRecipesPresenter, interactor: IRecipesInteractor) {
        self.presenter = presenter
        self.interactor = interactor
        presenter.didLoad(ui: recepiesView)
        super.init(nibName: nil, bundle: nil)
        self.onAddTag = { [weak self] (ingredient: Ingredient) in
            guard let viewController = self else { return }
            viewController.addIngredientTag(ingredient: ingredient)
        }
        self.onSave = { [weak self] () in
            guard let viewController = self else { return }
            viewController.save()
        }
        
        self.presenter.onAddPickedIngredient = self.onAddTag
        self.presenter.onSaveIngredients = self.onSave
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.recepiesView
    }
    
    private func addIngredientTag(ingredient: Ingredient) {
        collectionView.addTag(ingredient.name)
    }
    
    private func save() {
        if let selectedTags = collectionView.allSelectedTags() {
            for tag in selectedTags {
                collectionView.removeTag(tag)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Keyboard set up
        let closeKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(closeKeyboardTap)
        
//        self.recepiesView.addDoneButtonOnKeyboard()
        self.presenter.didLoad(ui: self.recepiesView)
        
        collectionView.alignment = .center
        collectionView.delegate = self

        self.view.addSubview(collectionView)

        let config = TTGTextTagConfig()
        config.backgroundColor = .systemBlue
        config.selectedBackgroundColor = .systemRed
        config.textColor = .white
        config.borderColor = .systemOrange
        config.borderWidth = 1
        config.cornerRadius = 5
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 580, width: view.frame.size.width, height: 80)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Recipes"
        self.recepiesView.pickedIngredients.removeAll()
        collectionView.removeAllTags()
    }
}


