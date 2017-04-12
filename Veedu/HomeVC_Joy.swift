//
//  HomeVC.swift
//  Veedu
//
//  Created by Joy Umali on 4/7/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var storyCategories = Story.stories
    
    var selectedIndexPath: IndexPath?
    
    @IBOutlet weak var storyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// MARK: DATA SOURCE

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = storyTableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as? StoryTVCell else {
            print("***Error with StoryCell***")
            return UITableViewCell()
        }
        
        // Story Images in TableView
        let storyImage = self.storyCategories[indexPath.row].storyImage
        cell.storyImage.image = UIImage(named: storyImage)

        
        // Story Labels in TableView
        cell.storyNameLabel.text = storyCategories[indexPath.row].storyName
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // user selected a story category.
        selectedIndexPath = indexPath
        
         // connect to Prathiba's ProductsPerCategoryVC
        let storyboard = UIStoryboard(name: "PrathibaMain", bundle: nil)
        guard let navController = storyboard.instantiateViewController(withIdentifier: "PrathibaHomeVC") as? UINavigationController else { return }
        guard let viewController = navController.viewControllers.first as? ProductsPerCategoryVC else { return }
        
        if let selectedIndexPath = selectedIndexPath {
            viewController.storyCategory = self.storyCategories[selectedIndexPath.row].firebaseStoryName
            present(navController, animated: true, completion: nil)
        }
       
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? ProductsPerCategoryVC {
//            if let selectedIndexPath = selectedIndexPath {
//            }
//        }
//    }
    
    
    
}
