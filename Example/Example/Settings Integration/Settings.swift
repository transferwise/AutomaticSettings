import AutomaticSettings

struct Settings: AutomaticSettingsStruct {
    enum Mode: String, AutomaticSettingsEnum {
        case linearRegression
        case weightedAverage
    }

    enum Algorithm: String, AutomaticSettingsEnum {
        case movingAverage
        case weightedMovingAverage
        case expotentialAverage
    }

    struct Calculation: AutomaticSettingsStruct {
        var text = ""
        var mode = Mode.linearRegression
    }

    // sourcery: injectFooter
    struct Smoothing: AutomaticSettingsStruct {
        var dayPeriod = 7
        var algorithm = Algorithm.movingAverage

        struct Grouped: AutomaticSettingsStruct {
            // sourcery: range = 1...4, step = 0.5
            var level: Float = 1

            var prettyCool = true
        }

        var grouped: Grouped = .init()
    }

    var calculation: Calculation = .init()
    var smoothing: Smoothing = .init()
}

final class SettingsExternal: ObservableObject {
}
