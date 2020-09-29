//
//  PokemonViewController.swift
//  Pokedex-C
//
//  Created by Deven Day on 9/29/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeIDLabel: UILabel!
    @IBOutlet weak var pokeAbilitiesLabel: UILabel!
    
    //MARK: - Properties
    var pokemon: DLDPokemon?
    var image: UIImage?
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
        fetchDefaultPokemon()
    }
    
    //MARK: - Helper Functions
    func updateViews() {
        guard let pokemon = pokemon, let image = image else {return}
        pokeNameLabel.text = pokemon.name.capitalized
        pokeIDLabel.text = "ID: \(pokemon.identifier)"
        pokeAbilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(separator: ", ").capitalized)
        pokeImageView.image = image
    }
    
    func fetchDefaultPokemon() {
        DLDPokemonController.fetchPokemon(forSearchTerm: "9") { (pokemon) in
            DLDPokemonController.fetchImage(for: pokemon) { (image) in
                DispatchQueue.main.async {
                    self.pokemon = pokemon
                    self.image = image
                    self.updateViews()
                }
            }
        }
    }
 
}//END OF CLASS

    //MARK: - Extensions
extension PokemonViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DLDPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            DLDPokemonController.fetchImage(for: pokemon) { (image) in
                DispatchQueue.main.async {
                    self.pokemon = pokemon
                    self.image = image
                    self.updateViews()
                }
            }
        }
    }
}//END OF EXTENSION
