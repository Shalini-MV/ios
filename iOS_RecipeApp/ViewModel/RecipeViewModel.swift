import Foundation
import Alamofire
import SwiftyJSON
import SVProgressHUD

class RecipeViewModel {
    
    static let shared = RecipeViewModel()
    init(){}
    
    var arrayRecipeList = [MDLRecipeList]()
    var dictRecipeDetail: MDLRecipeDetails?

}

//MARK: - Api Call

extension RecipeViewModel {
    
    func fetchMealListFromApi( _ completion: @escaping (Bool) -> Void) {
        
        let apiURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        AF.request(apiURL, method: .get).response { [weak self] (response) in
            guard let self else { return }
            
            switch response.result {
                
            case .success:
                
                let dataResult = JSON(response.value as Any)
                arrayRecipeList = dataResult["meals"].arrayValue.map({MDLRecipeList.init(params: $0)})
                
                var tempArrRecipeList = arrayRecipeList
                
                for i in 0..<arrayRecipeList.count {
                    if arrayRecipeList[i].recipeID == 0 || arrayRecipeList[i].recipeName == "" || arrayRecipeList[i].recipeImage == "" {
                        tempArrRecipeList.remove(at: i)
                    }
                }
                arrayRecipeList = tempArrRecipeList
                
                let sortedRecipes = arrayRecipeList.sorted(by: {$0.recipeName < $1.recipeName})
                arrayRecipeList = sortedRecipes
                
                completion(true)
                
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
    
    func fetchMealDetailsFromApi(mealID: Int, _ completion: @escaping (Bool) -> Void) {
        
        let apiURL = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        
        AF.request(apiURL, method: .get).response { [weak self] (response) in
            guard let self else { return }
            
            switch response.result {
            case .success:
                let dataResult = JSON(response.value as Any)
                let arrMealDetails = dataResult["meals"].arrayValue.map({MDLRecipeDetails(params: $0)})
                dictRecipeDetail = arrMealDetails[0]
                completion(true)
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
}

//MARK: - Show Alert

extension RecipeViewModel {
    
    func showAlert(viewController: UIViewController, alertTitle: String, alertMsg: String, actionTitle: String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .cancel))
        viewController.present(alert, animated: true)
    }
}

//MARK: - Show-Hide Progress Indicator

extension RecipeViewModel {
    
    func showProgressHud() {
        SVProgressHUD.show()
    }
    
    func dismissProgressHud() {
        SVProgressHUD.dismiss()
    }
}



