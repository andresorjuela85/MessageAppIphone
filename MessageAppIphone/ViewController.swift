//
//  ViewController.swift
//  MessageAppIphone
//
//  Created by Camilo Orjuela on 27/12/21.
//  Copyright © 2021 Camilo Orjuela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var moviesTwo: [OneMovie] = []
    var numberOfSections = 1
    var indexDeleteCell: IndexPath?
    var line:Int?
    
    
    @IBOutlet weak var messageList: UITableView!
    @IBOutlet weak var dismissAllButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let service = GetMessage()
        
        service.getList { moviesReceived in
            
            if let moviesReceived = moviesReceived {
                
                self.moviesTwo = moviesReceived.movies
                self.messageList.dataSource = self
                self.messageList.delegate = self
                self.messageList.reloadData()
                
            }
        }
            
        self.messageList.register(UINib(nibName: "messageCell", bundle: nil), forCellReuseIdentifier: "reuse")
    }

    @IBAction func dismissAllAction(_ sender: Any) {
        
        numberOfSections = 0
        
        let indexSet = IndexSet(integer: 0)
        messageList.deleteSections(indexSet, with: .top)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let secondView = segue.destination as? SecondViewController
        {
            secondView.selectedMovie = self.line
            secondView.showMovie = moviesTwo
            
        }
        
    }
   
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesTwo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let list = messageList.dequeueReusableCell(withIdentifier: "reuse", for: indexPath) as? messageCell else {
            return UITableViewCell()
        }
        
        list.delegate = self
        list.index = indexPath
        list.configurar(movie: moviesTwo[indexPath.row])
        
        return list
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        line = indexPath.row
        
        moviesTwo[indexPath.row].leido = true
        messageList.reloadData()
        
        //messageList.reloadRows(at: [indexPath], with: .none)
        
        performSegue(withIdentifier: "secondViewSegue", sender: self)
        
    }
}

extension ViewController: cellAction {
    
    func deleteCell(index: IndexPath) {
        
        moviesTwo.remove(at: index.row)
        messageList.beginUpdates()
        messageList.deleteRows(at: [index], with: .right)
        messageList.endUpdates()
        messageList.reloadData()
    }
}

