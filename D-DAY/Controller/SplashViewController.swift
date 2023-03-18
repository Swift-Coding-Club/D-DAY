//
//  SplashViewController.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/03/10.
//

import UIKit

import Lottie

//// 1. Create the AnimationView
//private var animationView: AnimationView?

class SplashViewController: UIViewController {
    
    
    @IBOutlet weak var splashLabel: UILabel!
    @IBOutlet weak var splashView: UIView!
    
    @IBOutlet weak var splashView2: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.splashLabel.alpha = 0 // 이미지의 투명도를 0으로 변경
        self.splashView.alpha = 0
        self.splashView2.alpha = 0

        UIView.animate(withDuration: 4.0, delay: 0.5, options: .curveEaseIn, animations: {
            
            // 동작할 애니메이션에 대한 코드
             print("애니메이션 실행!")
             self.splashLabel.alpha = 1 // 점진적으로 투명도가 1이 됩니다.
            self.splashView.alpha = 1
            self.splashView2.alpha = 1

            self.splashView.transform =  CGAffineTransform(translationX: -600, y:0)
            self.splashView2.transform =  CGAffineTransform(translationX: 600, y:-0)

             }, completion: { finished in
                 print("애니메이션 종료!")

                 self.splashView.alpha = 0
                 self.splashView2.alpha = 0

                 // 애니메이션이 종료되었을 때의 코드
                 let Storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                 guard let VC = Storyboard.instantiateViewController(identifier: "MainNavigationController") as? UINavigationController else { return }
                 VC.modalPresentationStyle = .fullScreen // 풀스크린으로 설정
                 self.present(VC, animated: false, completion: nil)
                 // 뷰가 등장하는 애니메이션 효과인 animated는 false로 설정
             })
  
    }

//    private func reset() {
//        splashView.frame = CGRect(x: 0, y: 150, width: 50, height: 50)
//        splashView.alpha = 1.0
//    }
}

