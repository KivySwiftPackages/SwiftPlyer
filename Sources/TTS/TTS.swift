import Foundation
import AVFoundation

public class TTS {
    
    let synth = AVSpeechSynthesizer()
    var voice: AVSpeechSynthesisVoice?
    
    init() {
        
    }
}

extension TTS {
    public func set_locale(locale: String) {
        self.voice = .init(language: locale)
    }
    
    public func speak(message: String) {
        
        if self.voice == nil {
            set_locale(locale: "en-US")
        }
        
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = self.voice
        
        synth.speak(utterance)
    }
    
    
}
