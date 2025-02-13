import Foundation

enum ViewEnums {
    enum CharacterCell {
        enum Icon {
            static let episodesBttn = "polygon"
            static let location = "placeholder"
        }
        
        enum Constraints {
            static let stackSpacing: CGFloat = 6
            static let characterImageViewHeight: CGFloat = 120
            static let nameLabelSpacing: CGFloat = 18
            static let infoLabelTop: CGFloat = 4
            static let episodesBttnTop: CGFloat = 12
            static let locationStackSpacing: CGFloat = 10
            static let statusBackgroundHeight: CGFloat = 8
            static let statusBackgroundWidth: CGFloat = 16
            
            static let collectionViewWidth: CGFloat = 48
            static let collectionViewHeight: CGFloat = 0.315
        }
    }
    
    enum CharacterView {
        enum Constraints {
            static let collectionLayoutSpacing: CGFloat = 32
            static let titleTop: CGFloat = 90
            static let titleLeading: CGFloat = 24
            static let collectionSpacing: CGFloat = 24
            static let messageLeading: CGFloat = 16
            static let messageTrailing: CGFloat = -16
        }
        
        enum String {
            static let title = "Characters"
            static let messageLabelEmpty = "Упс, ничего не найдено. Где-то в другой вселенной Рик бы нашел!"
            static let messageLabelError = "Упс! Что-то пошло не так. Рик перепутал кнопки!"
        }
    }
}
