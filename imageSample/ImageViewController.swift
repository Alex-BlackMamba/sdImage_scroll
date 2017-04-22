//
//  ImageViewController.swift
//  imageSample
//
//  Created by IBM on 4/21/17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ImageView.conten
         ImageView.image = newImage
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "back"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(callDismissViewController), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: -10, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem.init(customView: button)
        navigationItem.leftBarButtonItem = barButton
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func callDismissViewController() {
        navigationItem.leftBarButtonItem = nil
       dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
