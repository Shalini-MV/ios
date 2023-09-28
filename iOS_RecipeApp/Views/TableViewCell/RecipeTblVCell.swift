import UIKit


class RecipeTblVCell: UITableViewCell {

    @IBOutlet weak var viewRecipe: UIView!
    @IBOutlet weak var imgVRecipe: UIImageView!
    @IBOutlet weak var lblRecipeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayRecipeData(data: MDLRecipeList) {
        
        viewRecipe.layer.cornerRadius = 5
        imgVRecipe.layer.cornerRadius = 4
        lblRecipeName.text = data.recipeName
        imgVRecipe.setImageFromStringrURL(stringUrl: data.recipeImage)
    }
}
