//
//  UserScreen.swift
//  luxe
//
//  Created by Matthew Ramuta on 5/29/17.
//  Copyright © 2017 Luxe. All rights reserved.
//

import UIKit
import Material

class UserScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var bookings = ["Mon 8:00 AM", "Tues 9:00 AM", "Wed 10:00 AM"]
    
    
    fileprivate let fabMenuSize = CGSize(width: 56, height: 56)
    fileprivate let bottomInset: CGFloat = 24
    fileprivate let rightInset: CGFloat = 24
    
    fileprivate var fabButton: FABButton!
    fileprivate var fabMenu: FABMenu!
    
 
    
    

    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var chatInputBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var profileMenuWidth: NSLayoutConstraint!
    @IBOutlet weak var profileMenuLeftEdge: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func touchedChatInputTextField(_ sender: Any) {
        print("touched chat input text field")
        chatInputBottomMargin.constant = 400
        print(chatInputBottomMargin.constant)
    }
    
    @IBAction func toggleProfileMenu(_ sender: Any) {
        print("toggling")
        if(profileMenuLeftEdge.constant < 0){
            profileMenuLeftEdge.constant = 0
            viewDidLoad()
        } else {
            profileMenuLeftEdge.constant = -profileMenuWidth.constant
            viewDidLoad()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareFABButton()
        prepareFABMenu()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "luxebg.png")!)
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.clear
        
    
    }
    
    @IBAction func logoutUser(_ sender: Any) {
        User.logOutUser{ (status) in
            if status == true {
                self.dismiss(animated: true, completion: nil)
            }
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookingCell", for: indexPath) as! bookingsViewCell
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // Return number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookings.count
    }

    
    // Create table view rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookingCell", for: indexPath) as! bookingsViewCell
            cell.bookingTitle.text = bookings[indexPath.row]
            cell.bookingTitle.baselineAdjustment = .alignCenters
            cell.bookingIcon.image = UIImage(named: "booking.png")
    
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderColor = UIColor.gray.cgColor
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.white
         
            cell.contentView.layer.borderWidth = 0.2
                      cell.layer.masksToBounds = true
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120.0;//Choose your custom row height
    }
    


    
}

extension UserScreen {
    
    
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.moreVertical, tintColor: .yellow)
        fabButton.pulseColor = .white
        fabButton.backgroundColor = Color.black
    }
    

    
    fileprivate func prepareFABMenu() {
        fabMenu = FABMenu()
        var remindersFABMenuItem = FABMenuItem()
        remindersFABMenuItem.title = "Add Card"
        remindersFABMenuItem.fabButton.image = Icon.cm.add
        remindersFABMenuItem.fabButton.tintColor = .white
        remindersFABMenuItem.fabButton.pulseColor = .white
        remindersFABMenuItem.fabButton.backgroundColor = Color.black
        remindersFABMenuItem.fabButton.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        var notesFABMenuItem = FABMenuItem()
        notesFABMenuItem.title = "Concierge"
        notesFABMenuItem.fabButton.image = Icon.cm.bell
        notesFABMenuItem.fabButton.tintColor = .white
        notesFABMenuItem.fabButton.pulseColor = .white
        notesFABMenuItem.fabButton.backgroundColor = Color.black
       notesFABMenuItem.fabButton.addTarget(self, action: #selector(toChat), for: .touchUpInside)
        fabMenu.fabMenuItems = [notesFABMenuItem, remindersFABMenuItem]
        fabMenu.fabButton = fabButton
    
        view.layout(fabMenu)
            .size(fabMenuSize)
            .bottom(bottomInset)
            .right(rightInset)
    }
    
    func toChat() {
    
    self.performSegue(withIdentifier: "mover", sender: nil)
    
    }
    
    func addCard() {
    
        self.performSegue(withIdentifier: "ShowStripe", sender: nil)
    
    }
    

    
    
    
    
}



