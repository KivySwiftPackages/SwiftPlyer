import Foundation
import CoreLocation
import PythonCore
import PyCallable

public class Gps: NSObject {
    let location_manager = CLLocationManager()
    var on_location: PyPointer?
    var on_status: PyPointer?
    public override init() {
        
    }
    
    public func configure(on_location: PyPointer, on_status: PyPointer) {
        self.on_location = on_location
        self.on_status = on_status == .None ? nil : on_status
    }
}

fileprivate extension CLAuthorizationStatus {
    var pyInfo: (String, String) {
        switch self {
        case .notDetermined:
            ("provider-disabled", "notDetermined")
        case .restricted:
            ("provider-enabled", "restricted")
        case .denied:
            ("provider-disabled", "denied")
        case .authorizedAlways:
            ("provider-enabled", "authorizedAlways")
        case .authorizedWhenInUse:
            ("provider-enabled", "authorizedWhenInUse")
        case .authorized:
            ("provider-enabled", "authorized")
        @unknown default:
            ("provider-disabled", "unknown")
        }
    }
}

extension Gps: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard let on_status else {
            print("on_status have no been set")
            return
        }
        let (provider_status, s_status) = status.pyInfo
        do {
            try PythonCallWithGil(
                call: on_status,
                provider_status,
                "standard-ios-provider: \(s_status)"
            )
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    @available(iOS 14, *)
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let on_status else {
            print("on_status have no been set")
            return
        }
        let (provider_status, s_status) = manager.authorizationStatus.pyInfo
        do {
            try PythonCallWithGil(
                call: on_status,
                provider_status,
                "standard-ios-provider: \(s_status)"
            )
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location else { return }
        let coords = location.coordinate
        
        let lat = coords.latitude
        let lon = coords.longitude
        
        let acc = location.horizontalAccuracy
        let speed = location.speed
        let altitude = location.altitude
        let course = location.course
        if let on_location {
            do {
                try PythonCallWithGil(
                    call: on_location,
                    lat,
                    lon,
                    speed,
                    course,
                    altitude,
                    acc
                )
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
}
