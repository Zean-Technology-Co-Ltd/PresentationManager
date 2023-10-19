//
//  NNPresentationManager.swift
//  NiuNiuRent
//
//  Created by Q Z on 2023/4/24.
//

import UIKit
import FoundationEx

open class NNPresentationManager: NSObject {
    class fileprivate func nn_onShowPresentVC(_ presentVC: UIViewController,
                                          cornerRadius: CGFloat,
                                          animatedStyle: NNPresentationAnimatedStyle,
                                          alertStyle: NNPresentationStyle,
                                          completion: NNDissingHandler){
        let targetVC = topViewController()
        guard let targetVC = targetVC else { return }
        let delegate = NNPresentationController(presentVC,
                                                presentingVC: targetVC,
                                                cornerRadius: cornerRadius,
                                                animatedStyle: animatedStyle,
                                                alertStyle: alertStyle,
                                                handle: completion)
        presentVC.transitioningDelegate = delegate
        targetVC.present(presentVC, animated: true)
    }
}

extension NNPresentationManager {
    public class func nn_onShowWindowPresentVC(_ presentingVC: UIViewController){
        nn_onShowWindowPresentVC(presentingVC,
                                 cornerRadius: 0,
                                 animatedStyle: .popup,
                                 completion: nil)
    }

    
    public class func nn_onShowWindowPresentVC(_ presentingVC: UIViewController,
                                      cornerRadius: CGFloat){
        nn_onShowWindowPresentVC(presentingVC,
                                 cornerRadius: cornerRadius,
                                 animatedStyle: .popup,
                                 completion: nil)
    }

    public class func nn_onShowWindowPresentVC(_ presentVC: UIViewController,
                                      cornerRadius: CGFloat,
                                      style: NNPresentationAnimatedStyle,
                                      completion: NNDissingHandler){
        nn_onShowWindowPresentVC(presentVC,
                                 cornerRadius: cornerRadius,
                                 animatedStyle: .popup,
                                 completion: completion)
    }
    
    public class func nn_onShowWindowPresentVC(_ presentVC: UIViewController,
                                      cornerRadius: CGFloat,
                                        animatedStyle: NNPresentationAnimatedStyle,
                                      completion: NNDissingHandler){
        nn_onShowPresentVC(presentVC,
                           cornerRadius: cornerRadius,
                           animatedStyle: animatedStyle,
                           alertStyle: .alert,
                           completion: completion)
    }
}

extension NNPresentationManager {
    public class func nn_onShowActionSheetVC(_ presentVC: UIViewController){
        nn_onShowActionSheetVC(presentVC,
                               cornerRadius: 0,
                               completion: nil)
    }
    
    public class func nn_onShowActionSheetVC(_ presentVC: UIViewController,
                                      cornerRadius: CGFloat,
                                      completion: NNDissingHandler){
        nn_onShowActionSheetVC(presentVC,
                               cornerRadius: cornerRadius,
                               animatedStyle: .scale,
                               completion: nil)
    }

    public class func nn_onShowActionSheetVC(_ presentVC: UIViewController,
                                      cornerRadius: CGFloat,
                                      animatedStyle: NNPresentationAnimatedStyle,
                                      completion: NNDissingHandler){
        nn_onShowPresentVC(presentVC,
                           cornerRadius: cornerRadius,
                           animatedStyle: animatedStyle,
                           alertStyle: .actionSheet,
                           completion: completion)
    }
    
    fileprivate class func topViewController() -> UIViewController?{
        let topViewController = UIApplication.shared.nn_keyWindow?.rootViewController
        
        guard var topViewController = topViewController else { return nil }
        
        while (true) {
            if topViewController.presentedViewController != nil {
                topViewController = topViewController.presentedViewController!
            } else if topViewController is UINavigationController {
                let navi = topViewController as! UINavigationController
                topViewController = navi.topViewController!
            } else if topViewController is UITabBarController {
                let tab = topViewController as! UITabBarController
                topViewController = tab.selectedViewController!
            } else {
                break
            }
        }
        
        return topViewController
    }
}
