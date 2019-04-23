//
//  ViewController.swift
//  WebService
//
//  Created by Mahdi Mahjoobi on 4/24/19.
//  Copyright © 2019 Mahdi Mahjoobi. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var postionLbl: UILabel!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
    }


}

extension ViewController {
    
    func getUserInfo() {
        guard let url = URL(string: "https://api.myjson.com/bins/o2fvk") else {
            print("Error: URL is not valid")
            return
        }
        
        Alamofire.request(url).responseJSON { [weak self] response in
            
            if let user = response.data {
                let decoder = Result {try JSONDecoder().decode(Profile.self, from: user)}
                
                switch decoder {
                case .success(let profile):
                    self?.fullNameLbl.text = "\(profile.name) \(profile.lastName)"
                    self?.postionLbl.text = profile.info.position
                case .failure(let error):
                    self?.errorLbl.text = error.localizedDescription
                }
            }
            
        }
    }
    
}
