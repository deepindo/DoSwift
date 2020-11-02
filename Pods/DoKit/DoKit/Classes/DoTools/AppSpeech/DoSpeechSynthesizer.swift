//
//  DoSpeechSynthesizer.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/6.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation
import AVFoundation

open class DoSpeechSynthesizer: NSObject {
    
    /// 单例管理语音播报 比较适用于多种类型语音播报管理
    public static let shared = DoSpeechSynthesizer()
    
    /// 创建语音合成器
    public var synthesizer = AVSpeechSynthesizer()
    
    /// 实例化发声的对象
    public var speechUtterance: AVSpeechUtterance?
    
    /// 创建嗓音，指定嗓音不存在则返回nil
    public var voiceType = AVSpeechSynthesisVoice(language: Locale.current.languageCode)
    
    private override init() {
        super.init()
        
//        do {
//            /*AVAudioSessionCategoryPlayback：后台播报
//             .duckOthers：混合通道,语音播报时其他软件声音变小（音乐）
//             若不设置混合通道，在后台播报时会报codeCannotInterruptOthers错误 */
//            try AVAudioSession.sharedInstance().setCategory(.playback, options: .duckOthers)
//        } catch {
//            DDLog(error.localizedDescription)
//        }
        synthesizer.delegate = self
    }
    
    /// 语音播报方法
    public func speech(_ content: String) {
        if let _ = speechUtterance {
            synthesizer.stopSpeaking(at: .immediate)
        }
        
        /// 将 AVAudioSession 置为活动状态
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            DDLog(error.localizedDescription)
        }
        
        speechUtterance = AVSpeechUtterance(string: content)
        
        speechUtterance?.voice = voiceType
        speechUtterance?.rate = 0.5
        synthesizer.speak(speechUtterance!)
    }
}


/**
@protocol AVSpeechSynthesizerDelegate
@abstract
Defines an interface for delegates of AVSpeechSynthesizer to receive notifications of important speech utterance events.
*/
extension DoSpeechSynthesizer: AVSpeechSynthesizerDelegate {
    
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        
    }
    
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        
    }
    
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        
    }
    
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        
    }
    
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        /// 将 AVAudioSession 置为非活动状态
//        do {
//            try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
//            //try AVAudioSession.sharedInstance().setActive(false, withFlags: .notifyOthersOnDeactivation)
//        } catch {
//            DDLog(error.localizedDescription)
//        }
        speechUtterance = nil
    }
    
    public func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        
    }
}
