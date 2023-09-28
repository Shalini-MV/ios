import UIKit

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var lblRecipeDescription: UILabel!
    @IBOutlet weak var lblRecipeName: UILabel!
    @IBOutlet weak var imgVRecipe: UIImageView!
    @IBOutlet weak var viewInstructions: UIView!
    @IBOutlet weak var viewIngrediants: UIView!
    @IBOutlet weak var lblInstructions: UILabel!
    @IBOutlet weak var lblIngrediants: UILabel!
    
    var recipeID: Int?
    let recipeVM = RecipeViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    
    private func initialization() {
        self.viewMain.isHidden = true
        viewIngrediants.layer.cornerRadius = 5.0
        viewInstructions.layer.cornerRadius = 5.0
        imgVRecipe.layer.cornerRadius = 5.0
        fetchRecipeDatailsFromApi(recipeID: recipeID ?? 0)
    }
}


//MARK: - Api Call and set up UI

extension RecipeDetailViewController {
    
    private func fetchRecipeDatailsFromApi(recipeID: Int) {
        
        recipeVM.showProgressHud()
        if CheckInternetAvailabilty().isConnectedToNetwork() {
            recipeVM.fetchMealDetailsFromApi(mealID: recipeID, { [weak self] (isSuccess) in
                
                guard let self = self else { return }
                
                if isSuccess {
                    recipeVM.dismissProgressHud()
                    setUPUI()
                } else {
                    recipeVM.dismissProgressHud()
                    recipeVM.showAlert(viewController: self, alertTitle: "Oh No!", alertMsg: "Something went wrong, Please try again later", actionTitle: "OK")
                }
            })
        } else {
            recipeVM.dismissProgressHud()
            recipeVM.showAlert(viewController: self, alertTitle: "Warning!", alertMsg: "Please check your Internet connection", actionTitle: "OK")
        }
    }
    
    private func setUPUI() {
        
        self.viewMain.isHidden = false
        let recipeDetail = recipeVM.dictRecipeDetail
        lblRecipeDescription.text = "You can see recipe of \(recipeDetail?.recipeName ?? "") from here."
        lblRecipeName.text = recipeDetail?.recipeName
        imgVRecipe.setImageFromStringrURL(stringUrl: recipeDetail?.recipeImage ?? "")
        lblInstructions.text = recipeDetail?.recipeInstruction
        
        let strIngrediants = "\(recipeDetail?.ingredient1 ?? ""): \(recipeDetail?.measure1 ?? "")\n\(recipeDetail?.ingredient2 ?? ""): \(recipeDetail?.measure2 ?? "")\n\(recipeDetail?.ingredient3 ?? ""): \(recipeDetail?.measure3 ?? "")\n\(recipeDetail?.ingredient4 ?? ""): \(recipeDetail?.measure4 ?? "")\n\(recipeDetail?.ingredient5 ?? ""): \(recipeDetail?.measure5 ?? "")\n\(recipeDetail?.ingredient6 ?? ""): \(recipeDetail?.measure6 ?? "")\n\(recipeDetail?.ingredient7 ?? ""): \(recipeDetail?.measure7 ?? "")\n\(recipeDetail?.ingredient8 ?? ""): \(recipeDetail?.measure8 ?? "")\n\(recipeDetail?.ingredient9 ?? ""): \(recipeDetail?.measure9 ?? "")\n\(recipeDetail?.ingredient10 ?? ""): \(recipeDetail?.measure10 ?? "")"
        
        let strFilteredIngrediants = strIngrediants.replacingOccurrences(of: "\n:", with: "", options: NSString.CompareOptions.literal, range: nil)
        lblIngrediants.text = strFilteredIngrediants
    }
}
