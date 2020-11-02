//
//  DoAuthorization.swift
//  MCHT
//
//  Created by mac on 2019/12/26.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation
import UIKit
import AssetsLibrary
import Photos
import AVFoundation
import AddressBook
import Contacts


public enum PermissionType: Int {
    case photo = 0   //相册
    case capture     //相机
    case microPhone  //麦克风
    //case push        //推送
    case location    //位置
    case addressBook // 通讯录
}


open class DoAuthorization: NSObject {
    
    public static let shared = DoAuthorization()

    // MARK: - 检测相册权限
    
    public func isPhotoed() -> Bool {
        
        if #available(iOS 8.0, *) {
            let status = PHPhotoLibrary .authorizationStatus()
            if status == .restricted || status == .denied {
                return false
            } else {
                return true
            }
            
        } else {
            let author = ALAssetsLibrary.authorizationStatus()
            if author == .restricted || author == .denied {
                return false
                
            } else {
                return true
            }
        }
    }
    
    // MARK: - 检测相机权限
    
    public func isCaptureed() -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if status == .restricted || status == .denied {
            
            return false
            
        } else {
            return true
        }
    }
    
    // MARK: - 检测麦克风权限
    
    public func isMicroPhoneed() -> Bool {
        
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
        if status == .restricted || status == .denied {
            return false
        } else {
            return true
        }
    }
    
    // MARK: - 检测推送权限
    
    /*
    public func isPushPermission() -> Bool {
        
        if #available(iOS 8.0, *) {
            if UIApplication.shared.currentUserNotificationSettings?.types == .none {
                return false
            } else {
                return true
            }
            
        } else {
            if UIApplication.shared.enabledRemoteNotificationTypes() == .none {
                return false
            } else {
                return true
            }
        }
    }
 */
    
    // MARK: - 位置权限
    
    public func isLocationed() -> Bool {
        
        if CLLocationManager.locationServicesEnabled() && CLLocationManager.authorizationStatus() == .denied {
            return false
        } else {
            return true
        }
    }
    
    
    // MARK: - 通讯录权限
    
    public func isAddressBooked() -> Bool {
        
        if #available(iOS 9.0, *) {
            let status = CNContactStore.authorizationStatus(for: .contacts)
            if status == .restricted || status == .denied  {
                return false
            } else {
                return true
            }
        } else {
            let status = ABAddressBookGetAuthorizationStatus()
            if status == .restricted || status == .denied  {
                return false
            } else {
                return true
            }
        }
    }

    // MARK: - 检测权限, 并跳转界面
    
    public func judgePermission(_ type: PermissionType, _ controller: UIViewController,_ completion: (() -> ())) {
        switch type {
        case .photo:
            if !isPhotoed() {
                showAlert("未获得授权使用相册", "请在iOS\("设置")-\("隐私")-\("照片")中打开", controller)
                completion()
            }
            break
            
        case .capture:
            if !isCaptureed() {
                showAlert("未获得授权使用摄像头", "请在iOS\("设置")-\("隐私")-\("相机")中打开", controller)
                completion()
            }
            break
            
        case .microPhone:
            if !isMicroPhoneed() {
                //showAlert("未获得授权使用麦克风", "在您使用录制视频，上传视频等功能时打开麦克风，请点击'去设置'开启权限")
            }
            break
            
//        case .push:
//            if !isPushPermission() {
//                showAlert("推送权限未开启", "在您接受新的推送消息时使用推送权限，请点击立即'去设置'开启权限")
//            }
//            break
            
        case .location:
            if !isLocationed() {
                //showAlert("位置权限未开启", "在您定位，导航，获取位置时获取位置，请点击立即'去设置'开启权限")
            }
            break
            
        case .addressBook:
            if !isAddressBooked() {
                //showAlert("通讯录权限未开启", "在您获取通讯录联系人时访问通讯录，请前往'设置'>'隐私'>'通讯录服务'")
            }
            break
        }
    }
    
    // MARK: - 没有权限的 弹框
    
    public func showAlert(_ title: String, _ messsage: String, _ controller: UIViewController) {
        
        let c = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "知道了", style: .default, handler: nil)
        let setting = UIAlertAction(title: "去设置", style: .default) { action in
            self.toSystemPrivacySetting()
        }
        c.addAction(confirm)
        c.addAction(setting)
        controller.present(c, animated: true, completion: nil)
    }
    
    // MARK: - 设置权限界面
    
    public func toSystemPrivacySetting() {
        
//        if #available(iOS 8.0, *) {
//            UIApplication.shared.openURL(URL(string: UIApplication.UIApplicationOpenSettingsURLString)!)
//        } else {
            UIApplication.shared.openURL(URL(string:"prefs:General&path=Reset")!)
//        }
    }
}



