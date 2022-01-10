//
//  messageCell.swift
//  MessageAppIphone
//
//  Created by Camilo Orjuela on 27/12/21.
//  Copyright © 2021 Camilo Orjuela. All rights reserved.
//

import UIKit

protocol cellAction {
    func deleteCell (index: IndexPath)
}

class messageCell: UITableViewCell {

    
    @IBOutlet weak var readImage: UIImageView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    var delegate: cellAction?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        message.numberOfLines = 0
        
    }
    
    func configurar(movie: OneMovie) {
        
        message.text = movie.title
        readImage.isHidden = movie.leido ?? false
        
    }
    
    
    @IBAction func dismissButtonAction(_ sender: Any) {
        if let index = index    {
            
            delegate?.deleteCell(index: index)
        }
    }
    
}
