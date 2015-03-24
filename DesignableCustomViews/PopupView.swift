//
//  PopupView.swift
//  DesignableCustomViews
//
//  Created by Annemarie Ketola on 3/23/15.
//  Copyright (c) 2015 UpEarly. All rights reserved.
//

import UIKit

@IBDesignable class PopupView: UIView {
    
    var nibName = "PopupView"
    var view: UIView!
    
    // nib variables
    @IBOutlet weak var nibImageView: UIImageView!
    @IBOutlet weak var nibMessageLabel: UILabel!
    @IBOutlet weak var nibButton: UIButton!
    
    // this part of the code makes the nibImageView customizable in the storyboard
    @IBInspectable var image: UIImage? {
        get {
            return nibImageView.image
        }
        set(image) {
            nibImageView.image = image
        }
    }
    
    @IBInspectable var message: String? {
        get {
            return nibMessageLabel.text
        }
        set(message) {
                nibMessageLabel.text = message
            }
        }
    
    @IBInspectable var buttonText: String? {
        get {
            return nibButton.titleForState(UIControlState.Normal)
        }
        set(text) {
            nibButton.setTitle(text, forState: UIControlState.Normal)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override init(frame: CGRect) {  // used/called when programmer creates PopupView
       super.init(frame: frame)
        
        // extra login after init call
        setup()
    }

    required init(coder aDecoder: NSCoder) {  // used in storyboard or UI file
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        // setup the view from .xib
        var loadAtView = loadViewfromNib()
        loadAtView.frame = self.bounds
        loadAtView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        addSubview(loadAtView)
        
        // this part makes the rounded corners in all the called nibs
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    func loadViewfromNib() -> UIView {
        let  bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "PopupView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
        return view
    }
    
    override func prepareForInterfaceBuilder() {
        // setup anything that you need
        // view.backgroundColor = UIColor.blueColor()
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
