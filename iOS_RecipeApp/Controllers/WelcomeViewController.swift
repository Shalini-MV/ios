import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var btnLetsGo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        btnLetsGo.layer.cornerRadius = 5.0
    }
    
    @IBAction func tapLetsGoBtn(_ sender: UIButton) {
        let recipeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecipeListViewController") as! RecipeListViewController
        self.navigationController?.pushViewController(recipeVC, animated: true)
    }
}
