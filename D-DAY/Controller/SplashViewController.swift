//
//  SplashViewController.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/03/10.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var splashLabel: UILabel!
    
    @IBOutlet weak var animationView0: UIView!
    @IBOutlet weak var animationView1: UIView!
    @IBOutlet weak var animationView2: UIView!
    @IBOutlet weak var animationView3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 투명도 - 투명하게 시작
        self.splashLabel.alpha = 0.0
        self.animationView0.alpha = 0.0
        self.animationView1.alpha = 0.0
        self.animationView2.alpha = 0.0
        self.animationView3.alpha = 0.0

        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseIn, animations: {
            // 투명도 - 점점 선명해지게
            self.splashLabel.alpha = 1
            self.animationView0.alpha = 1
            self.animationView1.alpha = 1
            self.animationView2.alpha = 1
            self.animationView3.alpha = 1
            
            // 이동
            self.animationView0.transform =  CGAffineTransform(translationX: -600, y:0)
            self.animationView1.transform =  CGAffineTransform(translationX: 600, y:-0)
            self.animationView2.transform =  CGAffineTransform(translationX: -600, y:0)
            self.animationView3.transform =  CGAffineTransform(translationX: 600, y:-0)

             }, completion: { finished in
                 // 투명도 - 다시 투명하게 종료
                 self.animationView0.alpha = 0
                 self.animationView1.alpha = 0
                 self.animationView2.alpha = 0
                 self.animationView3.alpha = 0
                 
                 // 애니메이션이 종료되었을 때 MainVC로 이동
                 let Storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                 guard let VC = Storyboard.instantiateViewController(identifier: "MainNavigationController") as? UINavigationController else { return }
                 VC.modalPresentationStyle = .fullScreen
                 self.present(VC, animated: false, completion: nil)
             })
    }
}

