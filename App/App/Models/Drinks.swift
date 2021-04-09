//
//  Drinks.swift
//  App
//
//  Created by Fabian on 02/04/2021.
//

import Foundation

struct Drinks: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let idDrink: String
    let strDrink: String
    let strCategory: String
    let strGlass: String
    let strDrinkThumb: String
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    var ingredients: [String] {
        var array: [String] = []
        
        if let i = strIngredient1 { array.append(i) }
        if let i = strIngredient2 { array.append(i) }
        if let i = strIngredient3 { array.append(i) }
        if let i = strIngredient4 { array.append(i) }
        if let i = strIngredient5 { array.append(i) }
        if let i = strIngredient6 { array.append(i) }
        if let i = strIngredient7 { array.append(i) }
        if let i = strIngredient8 { array.append(i) }
        if let i = strIngredient9 { array.append(i) }
        if let i = strIngredient10 { array.append(i) }
        if let i = strIngredient11 { array.append(i) }
        if let i = strIngredient12 { array.append(i) }
        if let i = strIngredient13 { array.append(i) }
        if let i = strIngredient14 { array.append(i) }
        if let i = strIngredient15 { array.append(i) }
        
        return array
    }
    var measures: [String] {
        var array: [String] = []
        
        if let i = strMeasure1 { array.append(i) }
        if let i = strMeasure2 { array.append(i) }
        if let i = strMeasure3 { array.append(i) }
        if let i = strMeasure4 { array.append(i) }
        if let i = strMeasure5 { array.append(i) }
        if let i = strMeasure6 { array.append(i) }
        if let i = strMeasure7 { array.append(i) }
        if let i = strMeasure8 { array.append(i) }
        if let i = strMeasure9 { array.append(i) }
        if let i = strMeasure10 { array.append(i) }
        if let i = strMeasure11 { array.append(i) }
        if let i = strMeasure12 { array.append(i) }
        if let i = strMeasure13 { array.append(i) }
        if let i = strMeasure14 { array.append(i) }
        if let i = strMeasure15 { array.append(i) }
        
        return array
    }
}
