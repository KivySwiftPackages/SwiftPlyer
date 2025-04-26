import Foundation
import CoreMotion

public class Barometer {
    
    let altimeter = CMAltimeter()
    var pressure: Int = .zero
    public init() {
        
    }
    
    public func enable() {
        altimeter.startRelativeAltitudeUpdates(to: .main) {[weak self] data, error in
            guard let data else { return }
            self?.pressure = data.pressure.intValue
        }
    }
    
    public func disable() {
        altimeter.stopRelativeAltitudeUpdates()
    }
    
    public func get_pressure() -> Int {
        pressure * 10
    }
}


