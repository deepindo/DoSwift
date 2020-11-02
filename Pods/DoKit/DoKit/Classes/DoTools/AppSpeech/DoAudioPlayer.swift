//
//  DoAudioPlayer.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/6.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation
import AVFoundation

open class DoAudioPlayer: NSObject {
    
    /// 单例管理声音播放器
    public static let shared = DoAudioPlayer()
    
    /// 创建声音播放器
    public var audioPlayer: AVAudioPlayer?

    private override init() {
        super.init()

        audioPlayer?.delegate = self
    }
    
    /// 声音播放方法
    public func playAudio(_ audioPath: String) {
        
        if audioPath == "" { return }
        let url = URL(fileURLWithPath: audioPath)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        } catch {
            DDLog("Failed to set audio session category. Error: \(error)")
        }
    }
    
    /// 点击声音
    public func clickVoicePlay() {
        let path = Bundle.main.path(forResource: "Tock", ofType: "caf")!
        playAudio(path)
        audioPlayer?.play()
    }
    
    /// 微信收款语音
    public func wechatReceiptVoicePlay() {
        let path = Bundle.main.path(forResource: "微信收款", ofType: "mp3")!
        playAudio(path)
        audioPlayer?.play()
    }
    
    /// "微信收款到账1000.00万元"
    public func receipVoicePlay() {
        
    }
}


/**
@protocol AVAudioPlayerDelegate
@abstract
 events.
*/
extension DoAudioPlayer: AVAudioPlayerDelegate {
    
    
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer?.stop()
    }
    
    /* if an error occurs while decoding it will be reported to the delegate. */
    public func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
    }
}
