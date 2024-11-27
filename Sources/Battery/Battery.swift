import Foundation
import UIKit
import PySwiftCore
import PythonCore
import PyDictionary

public class Battery {
    let device = UIDevice.current
    
    public func get_state() -> PyPointer {
        
        var is_charging = false
        
        switch device.batteryState {
        case .charging:
            is_charging = true
        default: break
        }
        
        var status = PyDict_New()!
        let isCharging = is_charging.pyPointer
        let percentage = (device.batteryLevel * 100).pyPointer
        
        status.setPyDictItem("isCharging", isCharging)
        status.setPyDictItem("percentage", percentage)
        
        isCharging.decref()
        percentage.decref()
        
        return status
    }
}
