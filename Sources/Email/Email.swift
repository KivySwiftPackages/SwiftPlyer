import Foundation
import UIKit

public class Email {
    
    
    public init() {}
    
    public func send(recipient: String?, subject: String?, text: String?) {
        var uri = "mailto:"
        
        if let recipient {
            uri += recipient
        }
        
        if let subject {
            uri += !uri.contains("?") ? "?" : "&"
            uri += "subject="
            uri += subject
        }
        
        if let text {
            uri += !uri.contains("?") ? "?" : "&"
            uri += "body="
            uri += text
        }
        guard let url = URL(string: uri) else {
            print("email url failed")
            return
        }
        
        UIApplication.shared.open(url)
    }
}
