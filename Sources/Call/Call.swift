import Foundation
import UIKit

public class Call {
    
    func makecall(tel: String) {
        let url: URL = .init(string: "tel://\(tel)")!
        UIApplication.shared.open(url)
    }
    
    func dialcall(tel: String) {
        print("dialcall not possible, Access not provided by iPhone SDK")
    }
}
