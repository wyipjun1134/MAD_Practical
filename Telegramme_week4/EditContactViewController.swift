//
//  EditContactViewController.swift
//  Telegramme_week4
//
//  Created by Yip jun wei on 12/11/20.
//


import UIKit

class EditContactViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var mobileFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var firstNameFld: UITextField!
    var contactList: [Contact] = []
    override func viewDidLoad() {
       
      
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contactList = ContactController().RetrieveAllContact()
        mobileFld.text =  contactList[appDelegate.editRow].mobileNo
        lastNameFld.text = contactList[appDelegate.editRow].lastName
        firstNameFld.text =  contactList[appDelegate.editRow].firstName
    }


    
    @IBAction func doneBtn(_ sender: Any) {
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(String(contactList.count))
       if (firstNameFld.text != "" || lastNameFld.text != "" || mobileFld.text != "")
        {
           let c = Contact.init(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
            //appDelegate.contactList.append(c)
        ContactController().updateContact(mobilemo: contactList[appDelegate.editRow].mobileNo, newContact: c)
        
        //contactList[appDelegate.editRow].firstName = firstNameFld.text!;
        //contactList[appDelegate.editRow].lastName = lastNameFld.text!;
       //contactList[appDelegate.editRow].mobileNo = mobileFld.text!;
         
        _ = navigationController?.popViewController(animated: true)
        
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

