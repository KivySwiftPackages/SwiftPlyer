import Foundation
import UserNotifications
import UIKit

public class Notification {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
        
    }
    
    public func notify(title: String, message: String, app_name: String, app_icon: String,
                       timeout: Double, ticker: String = "", toast: Bool = false, hints: [String:Any] = [:]) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = .default
        content.increaseBadge()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeout, repeats: false)
        
        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        // add our notification request
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                //print("Notification with actions scheduled successfully")
            }
        }
    }
    
    func reset_badge() {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
}

fileprivate extension UNMutableNotificationContent {
    func increaseBadge() {
        if let badgeCount = badge?.intValue {
            badge = .init(integerLiteral: badgeCount + 1)
        } else {
            badge = .init(integerLiteral: 1)
        }
    }
}
