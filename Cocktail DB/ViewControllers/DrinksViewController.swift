//
//  ViewController.swift
//  Cocktail DB
//
//  Created by MineDest on 9/11/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController {

    @IBOutlet weak var drinksLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        drinksLabel.text = "Drinks"
        // Do any additional setup after loading the view.
    }
}
extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

