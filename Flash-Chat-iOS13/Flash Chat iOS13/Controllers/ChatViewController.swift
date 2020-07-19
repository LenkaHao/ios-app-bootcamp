//
//  ChatViewController.swift
//  Flash Chat iOS13
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    var messages: [Message] = [
        Message(sender: "123@abc.com", body: "Hey!"),
        Message(sender: "abc@abc.com", body: "What's up!")
    ]
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        super.viewDidLoad()
        
        title = K.appName
        navigationItem.hidesBackButton = true
        loadMessages()
    }
    
    func loadMessages() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
            if let e = error {
                print(e)
            } else {
                self.messages = []
                if let documents = querySnapshot?.documents {
                    for doc in documents {
                        let data = doc.data()
                        if let sender = data[K.FStore.senderField] as? String, let body = data[K.FStore.bodyField] as? String {
                            let message = Message(sender: sender, body: body)
                            self.messages.append(message)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let body = messageTextfield.text, let sender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: sender,
                K.FStore.bodyField: body,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if let e = error {
                    print(e)
                } else {
                    self.messageTextfield.text = ""
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            let alert = UIAlertController(title: "Failed to log out", message: "Please try again.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Cancle", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = self.messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label?.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImgView.isHidden = true
            cell.rightImgView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImgView.isHidden = false
            cell.rightImgView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        return cell
    }
    
    
}
