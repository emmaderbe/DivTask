import UIKit

final class CharacterListViewController: UIViewController {
    private let characterView = CharacterView()
    private let dataSource = CharacterListDataSource()
    private let delegate = CharacterListDelegate()
    
    override func loadView() {
        view = characterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterView.setDataSource(with: dataSource)
        characterView.setDelegate(with: delegate)
        
        characterView.setupTitle(with: "Characters")
    }
}
