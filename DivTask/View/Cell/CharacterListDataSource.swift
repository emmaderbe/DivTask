import UIKit

final class CharacterListDataSource:
    NSObject, UICollectionViewDataSource {
    private var character: [CharacterCellModel] = []
}

extension CharacterListDataSource {
    func updateCharacters(_ character : [CharacterCellModel]) {
        self.character = character
    }
}

extension CharacterListDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return character.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell
        else { return UICollectionViewCell() }
        let data = character[indexPath.row]
        cell.setupCell(with: data)
        return cell
    }
}
