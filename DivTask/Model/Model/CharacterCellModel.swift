import Foundation

enum CharacterStatus: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

enum CharacterStatusColor {
    static let aliveText = "customAliveText"
    static let aliveBackground = "customAliveBackground"
    static let deadText = "customDeadText"
    static let deadBackground = "customDeadBackground"
    static let unknownText = "customUnknownText"
    static let unknownBackground = "customUnknownBackground"
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
    let imageURL: String

    var buttonTitle: String {
        "Watch episodes"
    }

    var statusColorScheme: CharacterStatusColorScheme {
        switch status {
        case .alive:
            return CharacterStatusColorScheme(
                textColorName: CharacterStatusColor.aliveText,
                backgroundColorName: CharacterStatusColor.aliveBackground
            )
        case .dead:
            return CharacterStatusColorScheme(
                textColorName: CharacterStatusColor.deadText,
                backgroundColorName: CharacterStatusColor.deadBackground
            )
        case .unknown:
            return CharacterStatusColorScheme(
                textColorName: CharacterStatusColor.unknownText,
                backgroundColorName: CharacterStatusColor.unknownBackground
            )
        }
    }

    var statusText: String {
        status.rawValue.uppercased()
    }
}
