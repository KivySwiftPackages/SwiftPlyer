import Foundation
import CoreMotion
import PythonCore
import PySwiftCore
import PySerializing

fileprivate extension PyPointer {
    
    static func orientation_tuple<T: PySerialize>(_ a: T, _ b: T, _ c: T) -> PyPointer {
        let tuple = PyTuple_New(3)!
        PyTuple_SET_ITEM(tuple, 0, a.pyPointer)
        PyTuple_SET_ITEM(tuple, 1, b.pyPointer)
        PyTuple_SET_ITEM(tuple, 2, c.pyPointer)
        return tuple
    }
    
    static func compass_tuple<T: PySerialize>(_ a: T, _ b: T, _ c: T, _ d: T, _ e: T, _ f: T) -> PyPointer {
        let tuple = PyTuple_New(6)!
        PyTuple_SET_ITEM(tuple, 0, a.pyPointer)
        PyTuple_SET_ITEM(tuple, 1, b.pyPointer)
        PyTuple_SET_ITEM(tuple, 2, c.pyPointer)
        PyTuple_SET_ITEM(tuple, 3, d.pyPointer)
        PyTuple_SET_ITEM(tuple, 4, e.pyPointer)
        PyTuple_SET_ITEM(tuple, 5, f.pyPointer)
        return tuple
    }
}

public class Compass {
    let motion = CMMotionManager()
    
    var mg_x: Double = .zero
    var mg_y: Double = .zero
    var mg_z: Double = .zero
    
    var mf_x: Double = .zero
    var mf_y: Double = .zero
    var mf_z: Double = .zero
    
    public init() {
        motion.magnetometerUpdateInterval = 0.1
        motion.deviceMotionUpdateInterval = 0.1
    }
    
    public func enable() {
        motion.startMagnetometerUpdates(to: .main) {[weak self] data, error in
            guard let magneticField = data?.magneticField, let self else { return }
            self.mg_x = magneticField.x
            self.mg_y = magneticField.y
            self.mg_z = magneticField.z
        }
        
        motion.startDeviceMotionUpdates(to: .main) {[weak self] data, error in
            guard let field = data?.magneticField.field , let self else { return }
            self.mf_x = field.x
            self.mf_y = field.y
            self.mf_z = field.z
        }
    }
    
    public func disable() {
        motion.stopAccelerometerUpdates()
    }
    
    public func get_orientation() -> PyPointer {
        .orientation_tuple(mf_x, mf_y, mf_z)
    }
    
    public func get_field_uncalib() -> PyPointer {
        .compass_tuple(
            mg_x,
            mg_y,
            mg_z,
            mg_x - mf_x,
            mg_y - mf_y,
            mg_z - mf_z
        )
    }
}
