//
//  ViewController.swift
//  AlamofireSample
//
//  Created by Kazunori Aoki on 2021/03/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    private let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func excutionButton(_ sender: Any) {
        
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = "error" + error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
    
}

