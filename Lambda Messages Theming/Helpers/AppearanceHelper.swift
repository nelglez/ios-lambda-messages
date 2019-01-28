//
//  AppearanceHelper.swift
//  Lambda Messages Theming
//
//  Created by Nelson Gonzalez on 1/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//cant instantiate enum if there are no cases. We just need to call its static methods. We want to group them together.
enum AppearanceHelper {
    
    static var lambdaRed = UIColor(red: 212.0/255.0, green: 87.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    static var backgroundGray = UIColor(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)
    
    
    static func setupDarkAppearance(){
        //Change the apperance for all instances of UINavigationBar.
        //appearance proxy will set for all instances in our app.
        UINavigationBar.appearance().barTintColor = backgroundGray
        UIBarButtonItem.appearance().tintColor = lambdaRed
        UISegmentedControl.appearance().tintColor = lambdaRed
        
        UILabel.appearance().textColor = .white
        
        let textAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
        UITableViewCell.appearance().backgroundColor = backgroundGray
        
      //  UIView.appearance(whenContainedInInstancesOf: [UITableView.self]).backgroundColor = backgroundGray
        
        UITextField.appearance().keyboardAppearance = .dark
        UITextField.appearance().tintColor = lambdaRed
        UITextView.appearance().tintColor = lambdaRed
        
        

    }
    
    static func applicationFont(with textStyle: UIFontTextStyle, pointSize: CGFloat) -> UIFont {
    let result = UIFont(name: "RM Typerighter medium", size: pointSize)!
        //the size of the font scaled.
    return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: result)
        
    }
    
    
    static func style(button: UIButton) {
        button.titleLabel?.font = applicationFont(with: .callout, pointSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = lambdaRed
        button.layer.cornerRadius = 8
    }
}
