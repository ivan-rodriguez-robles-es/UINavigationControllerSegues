//
//  ViewController.swift
//  UINavigationControllerSegues
//
//  Created by ivk on 24/09/2020.
//  Copyright © 2020 irr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("ViewController vc0 viewDidLoad!...\(String(describing: self.title))")
        
        //print (self.title)
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func customSegue(_ coder: NSCoder) -> ViewControllerVC1? {
        print("customSegue Is going to load ViewControllerVC1")
        return ViewControllerVC1(coder: coder)
    }
    
    @IBAction func performSegueDidTapped(_ sender: Any, forEvent event: UIEvent) {
        
        performSegue(withIdentifier: "vc0Tovc1", sender: self)
        
    }

}



class ViewControllerVC1:UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("ViewControllerVC1 viewDidLoad!...\(String(describing: self.title))")
        
        //print (self.title)
        // Do any additional setup after loading the view.
    }
    @IBSegueAction func SegueAction(_ coder: NSCoder) -> UIViewController? {
        
        print("after the segue action");
        print("This segue instantiates a new  ViewController again");
        return ViewControllerVC2(coder: coder)
    }
    
    @IBAction func SegueActionButton(_ sender: Any, forEvent event: UIEvent) {
        print("first the button action.. and ");
        
    }
}

class ViewControllerVC2:UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("ViewControllerVC2 viewDidLoad !...\(String(describing: self.title))")
        
        //print (self.title)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushViewControllerButton(_ sender: Any) {

                let nc = storyboard?.instantiateViewController(identifier: "vc3") as! ViewControllerVC3
        self.navigationController?.pushViewController(nc, animated: true)
    }
    
}

class ViewControllerVC3:UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("ViewControllerVC3 - viewDidLoad!...\(String(describing: self.title))")
        self.view.backgroundColor = .darkGray
        //print (self.title)
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func segueActionWithData(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ViewControllerVC4? {
        
        let data = "pepito"
        return ViewControllerVC4(coder: coder, data: data)
    }
    
}

class ViewControllerVC4:UIViewController {
    
    let data : String
    
    @IBOutlet weak var labelData: UILabel!
    init?(coder: NSCoder, data: String) {
      self.data = data
      super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("ViewControllerVC4 - viewDidLoad!...\(String(describing: self.title))")
        
        self.view.backgroundColor = .darkGray
        
        
        labelData.text = data
        //print (self.title)
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func customTheSegue(_ coder: NSCoder) -> ViewControllerVC5? {
        print ("customSegue is going to load a ViewControllerVC5")
        return ViewControllerVC5(coder: coder)
    }
    
    @IBAction func popThisVC(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}

class ViewControllerVC5: UIViewController {
    
    // let data : String
    
    /*
    @IBOutlet weak var labelData: UILabel!
    init?(coder: NSCoder, data: String) {
      self.data = data
      super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("ViewControllerVC5 - viewDidLoad!...\(String(describing: self.title))")
        
        self.view.backgroundColor = .darkGray
        
        
        // labelData.text = data
        //print (self.title)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func popThisVC(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
