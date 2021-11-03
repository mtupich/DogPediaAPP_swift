//
//  ViewController.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 27/10/21.
//

import UIKit
import Foundation
import Kingfisher

class ViewController: UIViewController {
    var arrayCachorros = [Cachorro]()
    var api: CachorroAPI?
    let reuseIdentifier = "Celula"
    var favoritos : Bool = false
    
    lazy var uitv_Tabela: UITableView = {

        var tabela = UITableView()

        
        tabela.frame = self.view.bounds
        tabela.dataSource = self
        tabela.delegate = self
        tabela.separatorStyle = UITableViewCell.SeparatorStyle.none
        // tabela.register(CelulaCustomizadaElefanteTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        let nib = UINib(nibName: "CelulaCustomizadaCachorroTableViewCell", bundle: nil)
        tabela.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        
        return tabela

    }()
    // Injeção de dependencia por construtor
    convenience init(api: CachorroAPI) {
        self.init()
        self.api = api
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .rgb(red: 153, green: 195, blue: 206)
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        // Do any additional setup after loading the view.
      //  self.title = !favoritos ? "Lista de Cachorros" : "Favoritos"
        self.title = !favoritos ? "Lista de cachorros" : "Favoritos"
    
        self.view.addSubview(self.uitv_Tabela)
        
        self.populaArrayCachorrosAtualizaTableView() { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let cachorros):
                self?.arrayCachorros = cachorros
                DispatchQueue.main.async {
                    self?.uitv_Tabela.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
   
        print("Quantidade de Cachorros: \(self.arrayCachorros.count)")
        
        // self.uitv_Tabela.reloadData()
        self.createRightBarButton()

        
    }

    
    
    func populaArrayCachorrosAtualizaTableView(completion: @escaping (Result<[Cachorro], CachorroApiError>) -> Void) {
        if !favoritos {
           
            
            guard let mApi = self.api else { return }
                mApi.getCachorros(urlString: mApi.setCachorrosURL(), method: .GET) {[weak self] result in
                    guard self != nil else { return }

                switch result {
                case .success(let cachorros):
                    print(cachorros)
                    completion(Result.success(cachorros))
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }
        } else {
            let cachorros = self.getUserDefaults()

            for item in cachorros {
                print(item)
              //  let dog = Cachorro(_id: item, name: item, wikilink: item, image: item, note: item)
                let dog = Cachorro(_id: item._id, name: item.name, wikilink: item.wikilink,
                                   image: item.image, note: item.note)
                self.arrayCachorros.append(dog)
            }
        }
        self.uitv_Tabela.reloadData()
        // self.descobrirAsEspecies(elefantes: self.arrayDeElefantes)
    }
    func createRightBarButton() {
        let heartImage = UIImage(systemName: "heart.fill")
        let rightButton = UIBarButtonItem(image: heartImage, style: UIBarButtonItem.Style.plain,
                                          target: self, action: #selector(getFavoritos))
        rightButton.tintColor = .red
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
  
    
    @objc func getFavoritos() {
        let vc = ViewController()
        vc.favoritos = true
        self.show(vc, sender: nil)
}
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCachorros.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            as? CelulaCustomizadaCachorroTableViewCell
            cell?.uil_Titulo.text = self.arrayCachorros[indexPath.row].name
           // cell?.accessoryType = .disclosureIndicator // OIE EU MEXI AQUI PARA TIRAR A SETA
            if let image = self.arrayCachorros[indexPath.row].image {
                let url = URL(string: image)
                cell?.uiiv_Image.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "dog"),
                    options: [
                        .transition(ImageTransition.fade(2.0))
                    ],
                    progressBlock: nil,
                    completionHandler: { resultado in
                        switch resultado {
                        case .success(let image):
                            print(image.cacheType)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    })
        }
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = DetailViewController()
        detail.cachorroTocado = self.arrayCachorros[indexPath.row]
        if(favoritos){
            detail.favoritos = true
        }
        self.show(detail, sender: nil)
//        self.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)C
//        self.showDetailViewController(detail, sender: nil)
    }
}
