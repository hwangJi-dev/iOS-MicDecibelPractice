//
//  SplashVC.swift
//  JobChaeHBD
//
//  Created by 황지은 on 2021/06/22.
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet var hbdLogoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeShadow()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
       super.viewDidAppear(animated)

       self.view.layoutIfNeeded()
       self.hbdLogoImageView.alpha = 0.0

        UIView.animate(withDuration: 2.0, animations:
       {
           self.hbdLogoImageView.alpha = 1.0
           self.view.layoutIfNeeded()
       },completion: {finished in
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
           
            //뷰 전환
            let cakeVC = (self.storyboard?.instantiateViewController(identifier: "CakeVC"))! as CakeVC
            self.navigationController?.pushViewController(cakeVC, animated: true)
            self.navigationController?.setViewControllers([cakeVC], animated: false)
        }
       })
    }
    
    func makeShadow() {
        hbdLogoImageView.clipsToBounds = false
        hbdLogoImageView.layer.shadowColor = UIColor.black.cgColor
        hbdLogoImageView.layer.shadowOpacity = 1
        hbdLogoImageView.layer.shadowOffset = CGSize.zero
        hbdLogoImageView.layer.shadowRadius = 100
        hbdLogoImageView.layer.shadowPath = UIBezierPath(roundedRect: hbdLogoImageView.bounds, cornerRadius: 100).cgPath
    }
}
