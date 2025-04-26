//
//  Voip.swift
//  SwiftPlyer
//
//  Created by CodeBuilder on 26/04/2025.
//

import AVFoundation
import Foundation


public class Voip {
    let audio_engine = AVAudioEngine()
    let player_node = AVAudioPlayerNode()
    // processor = VoipMachine
    let error = NSError.init(domain: "org.kivy.voip", code: -1, userInfo: nil)
    
    public init() {
        
    }
    
    public func verify_permission() {
        
    }
    
    public func configure_audio_session() {
        
    }
    
    public func start_call() {
        
    }
    
    public func track_call_activity() {
        
    }
    
    public func start_audio_engine() {
        
    }
    
    public func end_call() {
        
    }
}
