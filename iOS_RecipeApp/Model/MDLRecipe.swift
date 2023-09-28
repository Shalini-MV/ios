import Foundation
import SwiftyJSON

struct MDLRecipeList {
    
    var recipeName = ""
    var recipeImage = ""
    var recipeID = 0
    
    init(params: JSON) {
        
        recipeName = params["strMeal"].stringValue
        recipeImage = params["strMealThumb"].stringValue
        recipeID = params["idMeal"].intValue
    }
}

struct MDLRecipeDetails {
    
    var recipeID = 0
    var recipeName = ""
    var recipeImage = ""
    var recipeInstruction = ""
    var ingredient1 = ""
    var ingredient2 = ""
    var ingredient3 = ""
    var ingredient4 = ""
    var ingredient5 = ""
    var ingredient6 = ""
    var ingredient7 = ""
    var ingredient8 = ""
    var ingredient9 = ""
    var ingredient10 = ""
    var measure1 = ""
    var measure2 = ""
    var measure3 = ""
    var measure4 = ""
    var measure5 = ""
    var measure6 = ""
    var measure7 = ""
    var measure8 = ""
    var measure9 = ""
    var measure10 = ""
    
    init(params: JSON) {
        
        recipeID = params["idMeal"].intValue
        recipeName = params["strMeal"].stringValue
        recipeImage = params["strMealThumb"].stringValue
        recipeInstruction = params["strInstructions"].stringValue
        ingredient1 = params["strIngredient1"].stringValue
        ingredient2 = params["strIngredient2"].stringValue
        ingredient3 = params["strIngredient3"].stringValue
        ingredient4 = params["strIngredient4"].stringValue
        ingredient5 = params["strIngredient5"].stringValue
        ingredient6 = params["strIngredient6"].stringValue
        ingredient7 = params["strIngredient7"].stringValue
        ingredient8 = params["strIngredient8"].stringValue
        ingredient9 = params["strIngredient9"].stringValue
        ingredient10 = params["strIngredient10"].stringValue
        measure1 = params["strMeasure1"].stringValue
        measure2 = params["strMeasure2"].stringValue
        measure3 = params["strMeasure3"].stringValue
        measure4 = params["strMeasure4"].stringValue
        measure5 = params["strMeasure5"].stringValue
        measure6 = params["strMeasure6"].stringValue
        measure7 = params["strMeasure7"].stringValue
        measure8 = params["strMeasure8"].stringValue
        measure9 = params["strMeasure9"].stringValue
        measure10 = params["strMeasure10"].stringValue
    }
}


