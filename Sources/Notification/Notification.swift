import Foundation
import UserNotifications

public class Notification {
    
    public func notify(title: String, message: String, app_name: String, app_icon: String,
                       timeout: Double, ticker: String = "", toast: Bool = false, hints: [String:Any] = [:]) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeout, repeats: false)
        
        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
}
