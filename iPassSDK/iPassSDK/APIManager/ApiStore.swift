//  ApiStore.swift
//  MyOutdoorAgent
//  Created by CS on 22/08/22.

import UIKit
import Alamofire

class ApiStore : NSObject {
    
    // MARK: - Shared Instance
    static let shared = ApiStore()
    
    
    // MARK: - Base Request API
    open func baseRequestApi<T: Codable>(_ url: URLConvertible, _ method : HTTPMethod, _ params: [String: Any]? = nil, _ headers: [String: String]? = nil, completion: @escaping (_ response : T?) -> Void){
        print(method)
        print(url)
        print(params as Any)
        print(headers as Any)
        if Reachability().isConnectedToNetwork() {
            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers?.toHeader()) { $0.timeoutInterval = 10 }.validate().responseDecodable(of: T.self) { response in
                
               // print(response)
                
                if response.data != nil {
                    if response.response?.statusCode == 200 {
                        
                        if let jsonData = response.data {
                            if self.isValidJson(check: jsonData) {
                                do {
                                    let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                    completion(dataModel)
                                } catch {
                                    print(error.localizedDescription)
                                }
                                
                            }
                            //                            else {
                            //                                HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                            //                            }
                        }
                    } else if response.response?.statusCode == 400 {
                        do {
                            if let jsonData = response.data {
                                if self.isValidJson(check: jsonData) {
                                    let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                    completion(dataModel)
                                }
                                //                                else {
                                //                                    HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                                //                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    //                    else if response.response?.statusCode == 401 {
                    ////                        try! Auth.auth().signOut()
                    ////                        if let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                    ////                            delegate.executeEnterFirstNameScreen()
                    ////                            LocalStore.shared.resetAllLocalParam()
                    ////                        }
                    //                    }
                    else if response.response?.statusCode == 500 {
                        do {
                            if let jsonData = response.data {
                              //  print(jsonData)
                                if self.isValidJson(check: jsonData) {
                                    let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                    completion(dataModel)
                                }
                                //                                else {
                                //                                    HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                                //                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    else {
                        do {
                            if let jsonData = response.data {
                                if self.isValidJson(check: jsonData) {
                                    let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                    completion(dataModel)
                                    self.handleErrorCase(response.response?.statusCode, dataModel as? NSDictionary)
                                }else {
                                  //  print(response.result)
                                    
                                }
                                //                                else {
                                //
                                //                                }
                            }
                        } catch {
                            print(String(data: response.data!, encoding: String.Encoding.utf8) as Any)
                        }
                    }
                } else {
                    // HUD.flash(.labeledError(title: EMPTY_STR, subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                }
            }
        } else {
            //return check your internet connection
        }
    }
    
    func baseRequestApi11(_ url: URLConvertible, _ method : HTTPMethod, _ params: [String: Any]?, _ headers: [String: String], completion: @escaping (_ response : [String:Any]? ) -> Void){
        
        AF.request(url, parameters: nil, headers:headers.toHeader()).validate(statusCode: 200 ..< 299).responseData { response in
                switch response.result {
                    case .success(let data):
                        do {
                            guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                                print("Error: Cannot convert data to JSON object")
                                
                                return
                            }
                            guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                                print("Error: Cannot convert JSON object to Pretty JSON data")
                                return
                            }
                            guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                                print("Error: Could print JSON in String")
                                return
                            }
                            completion(jsonObject)
                            print("---323232",prettyPrintedJson)
                           
                        } catch {
                            print("Error: Trying to convert JSON data to string")
                            return
                        }
                    case .failure(let error):
                        print(error)
                    if error.responseCode == 401 {
                        let dict = ["user": ["title": "Bad Request",
                                    "status": 401,
                                    "detail": "User does not exist"
                                           ]];
                        let dict2 = ["error": dict];
                            
                        completion(dict2)
                    }
                    else if error.responseCode == 403  {
                        let dict = ["user": ["title": "Bad Request",
                                     "status": 403,
                                     "detail": "Internal server error"
                                            ]];
                        let dict2 = ["error": dict];
                             
                         completion(dict2)
                    }
                    else{
                        let dict = ["user": ["title": "Bad Request",
                                     "status": 403,
                                     "detail": "Internal server error"
                                            ]];
                        let dict2 = ["error": dict];
                             
                         completion(dict2)
                        
                    }
                }
            }
        }
    
    
    // -- To check whether the json is valid or not
    func isValidJson(check data: Data) -> Bool {
        do {
            if let _ = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                return true
            } else if let _ = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray {
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
    // MARK: - Functions
    func handleErrorCase(_ statusCode : Int?, _ dict : NSDictionary?) {
        let msg = dict?.value(forKey: "message") as? String
        
        print("dict", dict as Any)
        print("msg->", msg as Any)
        print("statusCode->",statusCode!)
        
        
        if msg != nil {
            //if msg == AppErrors.sessionExpire.localizedDescription {
            //HUD.flash(.labeledError(title: EMPTY_STR, subtitle: msg), onView: UIApplication.visibleViewController.view, delay: 1.5) { _ in
            //self.goToLogin()
            //}
            //} else {
            //HUD.show(.labeledError(title: EMPTY_STR, subtitle: msg))
            //}
        }
    }
    
}

// MARK: - Dictionary Extension
extension Dictionary where Key == String, Value == String {
    func toHeader() -> HTTPHeaders {
        var headers: HTTPHeaders = [:]
        for (key, value) in self {
            headers.add(name: key, value: value)
        }
        return headers
    }
}
