import UIKit

final class CharacterListDataSource:
    NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell
        else { return UICollectionViewCell() }
        cell.setupText(name: "Rick Sanchez", info: "Human, male", bttn: "Watch episodes", location: "Earth (C-500A)", status: "Alive".uppercased())
        return cell
    }
}
