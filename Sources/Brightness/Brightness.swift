import Foundation
import UIKit

public class Brightness {
    let screen = UIScreen.main
    
    public func current_level() -> Double {
        screen.brightness * 100.0
    }
    public func set_level(level: Double) {
        screen.brightness = level / 100
    }
}
