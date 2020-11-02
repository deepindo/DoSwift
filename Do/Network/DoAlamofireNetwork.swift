//
//  DoAlamofireNetwork.swift
//  ConferenceSystem
//
//  Created by deepindo on 2020/9/18.
//  Copyright © 2020 deepindo. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON
import DoKit

//MARK:- 网络请求方法

public class DoAlamofireNetwork {
    
    //MARK: - 验证HTTPS
    
    private class func validateHTTPS() {
        let manager = SessionManager.default
        
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
    }
    
    //MARK: - DATA Request的基本方法封装
    
    private class func baseDataRequest(_ urlString: String,
                                       method: HTTPMethod,
                                       parameters: Parameters? = nil,
                                       headers: HTTPHeaders? = nil,
                                       success: @escaping (JSON) -> Void,
                                       failure: @escaping (Any?) -> Void) -> Void {
        
        Alamofire.request(URL(string: urlString)!,
                          method: method,
                          parameters: parameters,
                          encoding: URLEncoding.httpBody,
                          headers: nil).responseJSON { (response) in
                            
                            //DDLog(response.request)
                            //(response.response)
                            //DDLog(response.result)
                            
                            switch response.result {
                            case .success(let value):
                                
                                let json    = JSON(value)
                                let status  = json["status"].intValue
                                let message = json["msg"].stringValue
                                let data    = json["data"]
                                
                                /// 200：成功  201：失败  202：参数错误   203：token错误
                                switch status {
                                case 200:
                                    success(data)
                                default:
                                    failure(message)
                                }
                            case .failure(let error):
                                //DDLog(error)
                                let errorStr = error.localizedDescription
                                DDLog(errorStr)
                                
                                //SVProgressHUD.showError(withStatus: errorStr)
                                //SVProgressHUD.dismiss(withDelay: 1.0)
                                
                                failure(errorStr)
                            }
                          }
    }
    
    
    /*----------------------------DATA REQUEST----------------------------------------*/
    // MARK: - 对baseDataRequest封装
    /**
     默认选择对baseDataRequest封装
     */
    
    //MARK: 封装get请求
    public class func get(_ urlString: String,
                          parameters: Parameters? = nil,
                          headers: HTTPHeaders? = nil,
                          success: @escaping (JSON) -> Void,
                          failure: @escaping (Any?) -> Void) -> Void {
        validateHTTPS()
        baseDataRequest(urlString,
                        method: .get,
                        parameters: parameters,
                        headers: headers,
                        success: success,
                        failure: failure)
    }
    
    //MARK: 封装post请求
    
    public class func post(_ urlString: String,
                           parameters: Parameters? = nil,
                           headers: HTTPHeaders? = nil,
                           success: @escaping (JSON) -> Void,
                           failure: @escaping (Any?) -> Void) -> Void {
        validateHTTPS()
        baseDataRequest(urlString,
                        method: .post,
                        parameters: parameters,
                        headers: headers,
                        success: success,
                        failure: failure)
    }
    
    public class func httpbodyPost(_ urlString: String,
                                   bodyJson: Any,
                                   parameters: Parameters? = nil,
                                   headers: HTTPHeaders? = nil,
                                   success: @escaping (JSON) -> Void,
                                   failure: @escaping (Any?) -> Void) -> Void {
        validateHTTPS()
        baseDataRequest(urlString,
                        method: .post,
                        parameters: parameters,
                        headers: headers,
                        success: success,
                        failure: failure)
    }
    
    //MARK: 封装put请求
    public class func put(_ urlString: String,
                          parameters: Parameters? = nil,
                          headers: HTTPHeaders? = nil,
                          success: @escaping (JSON) -> Void,
                          failure: @escaping (Any?) -> Void) -> Void {
        validateHTTPS()
        baseDataRequest(urlString,
                        method: .put,
                        parameters: parameters,
                        headers: headers,
                        success: success,
                        failure: failure)
    }
    
    //MARK: 封装delete请求
    public class func delete(_ urlString: String,
                             parameters: Parameters? = nil,
                             headers: HTTPHeaders? = nil,
                             success: @escaping (JSON) -> Void,
                             failure: @escaping (Any?) -> Void) -> Void {
        validateHTTPS()
        baseDataRequest(urlString,
                        method: .delete,
                        parameters: parameters,
                        headers: headers,
                        success: success,
                        failure: failure)
    }
}

