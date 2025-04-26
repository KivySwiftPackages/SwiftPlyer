import Foundation
import CoreMotion
import PythonCore
import PySwiftCore
import PySerializing

fileprivate extension PyPointer {
    static func accelerometer_tuple<X,Y,Z>(_ x: X, _ y: Y, _ z: Z) -> PyPointer where X: PySerialize, Y: PySerialize, Z: PySerialize {
        let tuple = PyTuple_New(3)!
        PyTuple_SET_ITEM(tuple, 0, x.pyPointer)
        PyTuple_SET_ITEM(tuple, 1, y.pyPointer)
        PyTuple_SET_ITEM(tuple, 2, z.pyPointer)
        return tuple
    }
}

public class Accelerometer {
    let motion = CMMotionManager()
    
    var x: Double = .zero
    var y: Double = .zero
    var z: Double = .zero
    
    public init() {
        motion.accelerometerUpdateInterval = 0.1
    }
    
    public func enable() {
        motion.startAccelerometerUpdates(to: .main) {[weak self] data, error in
            guard let self, let acceleration = data?.acceleration else { return }
            self.x = acceleration.x
            self.y = acceleration.y
            self.z = acceleration.z
        }
    }
    
    public func disable() {
        motion.stopAccelerometerUpdates()
    }
    
    public func get_acceleration() -> PyPointer {
        .accelerometer_tuple(x, y, z )
    }
}
