import Foundation

enum CharacterStatus: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

struct CharacterStatusColorScheme {
    let textColorName: String
    let backgroundColorName: String
}

struct CharacterCellModel {
    let name: String
    let info: String
    let location: String
    let status: CharacterStatus
    let imageURL: URL?
    let image: Data?

    var buttonTitle: String {
        "Watch episodes"
    }

    var statusColorScheme: CharacterStatusColorScheme {
        switch status {
        case .alive:
            return CharacterStatusColorScheme(
                textColorName: ColorEnum.aliveText,
                backgroundColorName: ColorEnum.aliveBackground
            )
        case .dead:
            return CharacterStatusColorScheme(
                textColorName: ColorEnum.deadText,
                backgroundColorName: ColorEnum.deadBackground
            )
        case .unknown:
            return CharacterStatusColorScheme(
                textColorName: ColorEnum.unknownText,
                backgroundColorName: ColorEnum.unknownBackground
            )
        }
    }

    var statusText: String {
        status.rawValue.uppercased()
    }
}
