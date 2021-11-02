//
//  UIViewController.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 29/10/21.
//

import Foundation
import UIKit

extension UIViewController {

    func saveUserDefaults(dog: Cachorro) {
        let defaults = UserDefaults.standard
        var cachorrosFavoritados = self.getUserDefaults()
        if !cachorrosFavoritados.contains(where: {$0.name == dog.name}){ cachorrosFavoritados.append(dog)
            defaults.set(try? PropertyListEncoder().encode(cachorrosFavoritados), forKey: "cachorros")
        }
        _ = self.getUserDefaults()
    }
    func deleteFavorite(dog: Cachorro) {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?",
                                              preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
            let defaults = UserDefaults.standard
            var arrayFavoritos = self.getUserDefaults()
            if let index = arrayFavoritos.firstIndex(where: { $0.name == dog.name }) {
                print(index)
                arrayFavoritos.remove(at: index)
            }
    //        arrayFavoritos.remove(at: index)
            print(arrayFavoritos)
            defaults.set(try? PropertyListEncoder().encode(arrayFavoritos), forKey: "cachorros")
            _ = self.getUserDefaults()
        })

        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }

        // Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)

        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    }

    func getUserDefaults() -> [Cachorro] {
//        let defaults = UserDefaults.standard
        var userData: [Cachorro]!
//        guard let arrayString = defaults.object(forKey: "cachorros") as? [Cachorro] else { return []}
        if let data = UserDefaults.standard.value(forKey: "cachorros") as? Data {
            userData = try? PropertyListDecoder().decode([Cachorro].self, from: data)
            return userData!
        } else {
            userData = []
            return userData
        }
    }
}
