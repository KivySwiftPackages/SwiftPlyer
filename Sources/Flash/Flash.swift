import Foundation
import AVFoundation
import PySwiftCore

public class Flash {
    let camera = AVCaptureDevice.default(for: .video)
    
    public func on() {
        do {
            try camera?.lockForConfiguration()
            try camera?.setTorchModeOn(level: 1)
            camera?.unlockForConfiguration()
        }
        catch let err {
            err.pyExceptionError()
        }
    }
    
    public func off() {
        do {
            try camera?.lockForConfiguration()
            try camera?.setTorchModeOn(level: 0)
            camera?.unlockForConfiguration()
        }
        catch let err {
            err.pyExceptionError()
        }
    }
}
