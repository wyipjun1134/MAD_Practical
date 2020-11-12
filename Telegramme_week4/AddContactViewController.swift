//
//  AddContactViewController.swift
//  Telegramme_week4
//
//  Created by Yip jun wei on 12/11/20.
//


import UIKit

class AddContactViewController: UIViewController {

  
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func cancelBtn(_ sender: Any) {
       firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    @IBAction func createBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(String(appDelegate.contactList.count))
       if (firstNameFld.text != "" || lastNameFld.text != "" || mobileFld.text != "")
        {
            let c = Contact.init(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
            appDelegate.contactList.append(c)
       
        
        let alert = UIAlertController(title: "Contact Added", message: "Contact \(firstNameFld.text!) \( lastNameFld.text!) has been added successfully.", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
        
         firstNameFld.text = ""
         lastNameFld.text = ""
         mobileFld.text = ""
       }
        else
       {
        let alert = UIAlertController(title: "Error", message: "Please make sure all the textfields has been filled in.", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
        
       }
      
    }
    
    
}

