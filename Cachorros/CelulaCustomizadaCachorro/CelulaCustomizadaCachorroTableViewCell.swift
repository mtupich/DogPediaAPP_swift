//
//  CelulaCustomizadaElefanteTableViewCell.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 28/10/21.
//

import UIKit
import SnapKit

class CelulaCustomizadaCachorroTableViewCell: UITableViewCell {

//    @IBOutlet weak var uiiv_Image: UIImageView!
//    @IBOutlet weak var uil_Titulo: UILabel!
//    @IBOutlet weak var cardView: UIView!
    
    
    @IBOutlet weak var uiiv_Image: UIImageView!
    @IBOutlet weak var uil_Titulo: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        uil_Titulo.snp.makeConstraints { make in
//
//            make.top.equalTo(self).offset(10)
//            make.right.equalTo(self).offset(0)
//            make.left.equalTo(uiiv_Image.snp.right).offset(25)
//            make.bottom.equalTo(self).offset(10)
//        }
//
//
//        self.uiiv_Image.snp.makeConstraints { make in
//            make.top.equalTo(self).offset(10)
//            make.bottom.equalTo(self).offset(-10)
//            make.centerX.equalTo(self)
//            make.centerY.equalTo(self)
//        }
        
        self.uiiv_Image.layer.cornerRadius = 10
        self.uiiv_Image.layer.borderWidth = 1.0
        self.uiiv_Image.layer.masksToBounds = true


        self.cardView.layer.cornerRadius = 15
        self.cardView.layer.shadowColor = UIColor.black.cgColor
        self.cardView.layer.shadowOpacity = 0
        self.cardView.layer.shadowOffset = .zero
        self.cardView.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
