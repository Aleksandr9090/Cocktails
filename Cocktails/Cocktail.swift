//
//  Cocktail.swift
//  Cocktails
//
//  Created by Aleksandr on 16.10.2022.
//

import Foundation

struct Cocktail: Decodable {
    let strDrink: String?
    let strGlass: String?
    let strInstructions: String?
    let strDrinkThumb: String?
}

struct AboutCocktails: Decodable {
    let drinks: [Cocktail]?
}

enum Link: String {
    case cocktailsInfo = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
}
