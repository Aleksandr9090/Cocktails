//
//  CocktailsViewController.swift
//  Cocktails
//
//  Created by Aleksandr on 16.10.2022.
//

import UIKit

class CocktailsViewController: UICollectionViewController {
    
    private var cocktails: [Cocktail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchCocktailsInfo()

    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cocktails.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell",
                for: indexPath
            ) as? CocktailCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.cocktailCellLabel.text = cocktails[indexPath.row].strDrink ?? ""
        
    
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    private func fetchCocktailsInfo() {
        guard let url = URL(string: Link.cocktailsInfo.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let cocktailInfo = try JSONDecoder().decode(AboutCocktails.self, from: data)
                self.cocktails = cocktailInfo.drinks ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
        
        
        
        
    }
    
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension CocktailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
}


