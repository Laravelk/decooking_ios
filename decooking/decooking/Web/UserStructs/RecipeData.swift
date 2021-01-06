//
//  RecipeData.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import Foundation

struct DishNationality: Codable {
    var id: String
    var name: String
}

struct WayToCook: Codable {
    var id: String
    var name: String
}

struct IngredientFromRecipes: Codable {
    var id: String
    var name: String
    var amount: Float
    struct Measure: Codable {
        var measureId: String
        var name: String
        var shortNote: String
    }
    var measure: Measure
    var importance: Int
    var calories: Float
}

struct RecipeData: Codable {
    var id: String
    var name: String
    var description: String
    var instruction: String
    var dishNationality: DishNationality
    var isVegan: Bool
    var rating: Int
    var waysToCook: [WayToCook]
    var ingredients: [IngredientFromRecipes]
    var calories: Float
}

