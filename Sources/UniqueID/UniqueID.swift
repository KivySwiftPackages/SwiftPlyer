import Foundation
import UIKit
import PythonCore
import PySerializing

public class UniqueID {
    
    public init() {
        
    }
    
    public func get_uid() -> String {
        UIDevice.current.identifierForVendor?.uuidString ?? "error with uuid"
    }
    
    
}
