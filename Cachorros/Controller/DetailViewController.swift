//
//  DetailViewController.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 27/10/21.
//

import UIKit
import SafariServices

 class DetailViewController: UIViewController {
  
    let reuseIdentifier = "Celula"
    var cachorroTocado: Cachorro = Cachorro()
    var favoritos: Bool = false
     
     
    lazy var uitv_Tabela: UITableView = {
        
        // CONFIG TABELA
        var tabela = UITableView()
        tabela.frame = self.view.bounds
        tabela.dataSource = self
        tabela.delegate = self
        tabela.separatorStyle = .none
       // tabela.backgroundColor = .clear
        //tabela.backgroundColor = .blue // setei uma cor no BG da detail
        
        return tabela

    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .rgb(red: 225, green: 136, blue: 72)
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
        
        self.title = "Mais informações"
        
        self.view.addSubview(self.uitv_Tabela)
      
    
    }
     

}
// criamos uma extension para dividir o código

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // CELULA PADRÃO
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)

        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15.0)
        cell.backgroundColor = .clear // setei uma cor no BG da detail
        
        
        switch indexPath.row {
        case 0:
            
            let cellImage = ImageViewCell()
            guard let urlString = cachorroTocado.image else { return UITableViewCell() }
            guard let url = URL(string: urlString) else { return UITableViewCell() }
            cellImage.setImageView(url: url, rounded: true)
           // cellImage.backgroundColor = .clear // setei uma cor no BG da detail
            return cellImage
            
            
        case 1:
            guard let name = cachorroTocado.name else { return UITableViewCell() }
            cell.textLabel?.text = "Nome: "
            cell.detailTextLabel?.text = name
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15.0)
            
        case 2:
            guard let wikilink = cachorroTocado.wikilink else {return UITableViewCell()}
            cell.textLabel?.text = "Quer saber mais? Acesse: "
            cell.detailTextLabel?.text = wikilink
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
            cell.detailTextLabel?.textColor = .blue
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .blue
        
        case 3:
            guard let note = cachorroTocado.note else {return UITableViewCell()}
            cell.textLabel?.text = "Descrição: "
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
            cell.detailTextLabel?.text = note
            cell.detailTextLabel?.numberOfLines = 0
           
           
          

        case 4:
            if(!favoritos){
                cell.textLabel?.text = "Adicionar aos favoritos"
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
                
            }else {
                cell.textLabel?.text = "Remover dos Favoritos"
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
            }


        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
}

extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 2 {
            //abrir o safari
            guard let urlString = cachorroTocado.wikilink else {return}
            guard let url = URL(string: urlString) else {return}
            
            let safariVC = SFSafariViewController(url: url)
            self.showDetailViewController(safariVC, sender: nil)
        }
        
        if indexPath.row == 4 {
            
            if(!favoritos){

                self.saveUserDefaults(dog: cachorroTocado)
                
            }else{

                self.deleteFavorite(dog: cachorroTocado)
            }
        }
        
        
        
}
    
    
    
}


