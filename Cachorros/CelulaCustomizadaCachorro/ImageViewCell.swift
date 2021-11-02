//
//  ImageViewCell.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 28/10/21.
//

import UIKit
import SnapKit
import Kingfisher

class ImageViewCell: UITableViewCell {
    
    var uiiv_Image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //reescrevendo o construtor
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // adicionar a imagem
        self.addSubview(self.uiiv_Image)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageView(url: URL, rounded: Bool = false) {
        
        if rounded {
        
            self.uiiv_Image.layer.cornerRadius = 50
            self.uiiv_Image.layer.borderWidth = 1.0
            self.uiiv_Image.layer.masksToBounds = true

        
        }
        
        self.uiiv_Image.contentMode = .scaleAspectFit
            
        self.uiiv_Image.kf.setImage(with: url,
                                    options: [
                                        .cacheOriginalImage
                                    ],
                                    completionHandler: { result in
                
                                    })
    
        
        
        self.uiiv_Image.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(250)
            make.height.equalTo(250)
        }
        
        self.uiiv_Image.contentMode = UIView.ContentMode.scaleAspectFill
}
}
