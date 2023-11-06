//  Apis.swift
//  iPassSDK1
//  Created by Mobile on 08/02/23.

import UIKit
import Alamofire

open class Apis: NSObject {
    
    fileprivate struct Constants {
        static let shared = Apis()
    }
    
    var baseUrl = ""
    
    // MARK: - 1 Token API
    open func initJWTToken(first_name: String,last_name:String,password:String,email:String,token:String, completion: @escaping(_ : JWTToken? , ErrorBase?) -> Void) {
        let params : [String: String] = [
            "first_name" : first_name,
            "last_name" : last_name,
            "email" : email,
            "password" : password,
        ]
        
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.jwtToken.rawValue +  token
        
        ApiStore.shared.baseRequestApi(baseUrl, .post, params, nil) { (result: JWTToken?) in
            if result?.message == "Fail"{
                completion(nil,result?.error)
            }else if result?.message == "Success." {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 2 Initiate Account
    open func callApiMethodUpdateValues(_ accessToken: String, _ apiAuthorizationToken:String, completion: @escaping(_ : AccountTokenModel? , ErrorBase?) -> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.token.rawValue +  accessToken
        
        let params = ["customerInternalReference": "1","workflowDefinition": ["key": 10032,"capabilities":["watchlistScreening":["additionalProperties": "string"]]],"callbackUrl": "https://www.google.com","userReference": "YOUR_USER_REFERENCE","tokenLifetime": "5m","web":["successUrl": "https://ipassreact.csdevhub.com/success","errorUrl": "https://ipassreact.csdevhub.com/error","locale": "en"]] as [String : Any]
        
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result: AccountTokenModel?) in
            if result?.message == "Fail"{
                completion(nil,result?.error)
            }else if result?.message == "Success." {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 3. Workflow Status
    open func getWorkFlowStatus (_ accessToken:String, _ apiAuthorizationToken:String,_ accountId:String, _ workflowExecutionId:String, completion:@escaping (_ : WorkFlowStatusModel?, _ :  WorkFlowStatusError?)-> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.workFlowStatus.rawValue +  accessToken + "&accountId=\(accountId)" +  "&workflowExecutionId=\(workflowExecutionId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: WorkFlowStatusModel?) in
            if result?.message == "Fail"{
                completion(nil,result?.error)
            }else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 4. User Details
    open func getUserDetail (accessToken:String, apiAuthorizationToken:String, accountId:String, sessionId :String, email :String, workflowExecutionId:String, completion:@escaping (_ : UserDetailModel?, _ :  UserDetailError?)-> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.detailUser.rawValue +  accessToken + "&accountId=\(accountId)" +  "&workflowExecutionId=\(workflowExecutionId)" +  "&sessionId=\(sessionId)" +  "&email=\(email)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: UserDetailModel? ) in
            if result?.message == "Fail"{
                completion(nil,result?.error)
            }else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 5. Front Image
    open func getUserFrontImage (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.frontimage.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 6. Back Image
    open func getbackImage (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.backImage.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
        
    }
    
    // MARK: - .7 Face Image
    open func getfaceImage (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.faceImage.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 8. LiveNess Image1
    open func getUserlivenessImage1 (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.liveness1.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 9. LiveNess Image2
    open func getUserlivenessImage2 (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.liveness2.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 10. LiveNess Image3
    open func getUserlivenessImage3 (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.liveness3.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 11. LiveNess Image4
    open func getUserlivenessImage4 (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.liveness4.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 12. LiveNess Image5
    open func getUserlivenessImage5 (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.liveness5.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 13. LiveNess Image6
    open func getUserlivenessImage6 (accessToken:String, apiAuthorizationToken:String, credentialId:String, accountId :String, completion:@escaping (_ : FrontImageData?, _ :  Error111?)-> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.liveness6.rawValue + "?credentialId=\(credentialId)" + "&token=\(accessToken)" + "&accountId=\(accountId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":apiAuthorizationToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result: FrontImageData? ) in
            if result?.message == "Fail" {
                completion(nil,result?.error)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 14. Delete account
    open func deletAccount(token:String,accountId:String,workflowExecutionId:String,authToken :String,completion :@escaping(_ : DeleteAccountDataModel?, _ : ErrorBase?) -> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.deleteAccData.rawValue + token + "&accountId=\(accountId)" + "&workflowExecutionId=\(workflowExecutionId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        
        ApiStore.shared.baseRequestApi(baseUrl, .delete, nil, headers.dictionary) { (result: DeleteAccountDataModel?) in
            if result?.message == "Fail"{
                completion(nil,result?.error)
            }else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 15. Delete All Data
    open func deletAccountData(token:String,accountId:String,workflowExecutionId:String,authToken :String,completion :@escaping(_ : DeleteAccountDataModel?, _ : ErrorBase?) -> Void) {
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + Endpoints.deleteAccData.rawValue + token + "&accountId=\(accountId)" + "&workflowExecutionId=\(workflowExecutionId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        
        ApiStore.shared.baseRequestApi(baseUrl, .delete, nil, headers.dictionary) { (result: DeleteAccountDataModel?) in
            if result?.message == "Fail"{
                completion(nil,result?.error)
            }else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 16. Kyc Initiate Account
    open func kYCInitialiseAccountApi(token:String,jwtToken: String,accountId:String,customerInternalReference:Int,workflowDefinition: [String:Any], completion :@escaping(_ : KYCInitateModel?,_ : KYCInitateError?) -> Void){
        
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + KYCEndpoints.initKYCAccount.rawValue +  token + "&accountId=\(accountId)"
        let params: [String: Any] = ["customerInternalReference": customerInternalReference, "workflowDefinition": workflowDefinition]
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":jwtToken]
        ApiStore.shared.baseRequestApi(baseUrl,.put,params,headers.dictionary) { (result: KYCInitateModel? ) in
            if result?.message == "Fail" {
                // print(result?.error)
                completion(nil,(result?.error)!)
            } else if result?.message == "Success" {
                
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 17. Kyc Prepare Data
    open func kycPrepareData(token:String,authToken:String,accountId:String,workflowExecutionId: String,credentialId: String,firstName:String,lastName: String,dateOfBirth: String,completion : @escaping(_:KYCPrePareData?,_ :KYCPrePareError?  ) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + KYCEndpoints.kycPrepareData.rawValue +  token + "&accountId=\(accountId)" + "&workflowExecutionId=\(workflowExecutionId)" + "&credentialId=\(credentialId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        let params: [String: String] = ["firstName": firstName, "lastName": dateOfBirth, "dateOfBirth": dateOfBirth]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result : KYCPrePareData?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
    
    // MARK: - 18. Kyc Put Prepare Data
    open func kycPutPrepareData(token:String,authToken:String,accountId:String,workflowExecutionId: String,firstName:String,lastName: String,dateOfBirth: String,completion : @escaping(_:KYCPUTPrePareData?,_ :KYCPUTPrePareError?  ) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + KYCEndpoints.kycPUTPrepareData.rawValue +  token + "&accountId=\(accountId)" + "&workflowExecutionId=\(workflowExecutionId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        ApiStore.shared.baseRequestApi(baseUrl, .put,nil,headers.dictionary) { (result : KYCPUTPrePareData?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
    
    // MARK: - 19. Kyc Workflow Status
    open func kycWorkflowStatus(token:String,authToken:String,accountId:String,workflowExecutionId: String,firstName:String,lastName: String,dateOfBirth: String,completion : @escaping(_:KYCWorkflowStatusModel?,_ :KYCWorkflowStatusError?  ) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + KYCEndpoints.kycWorkFlowStatus.rawValue +  token + "&accountId=\(accountId)" + "&workflowExecutionId=\(workflowExecutionId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result : KYCWorkflowStatusModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
    
    // MARK: - 20. Kyc User Detail
    open func kycUserDetail(token:String,authToken:String,accountId:String,workflowExecutionId: String,firstName:String,lastName: String,dateOfBirth: String,completion : @escaping(_:KYCUserDetailModel?,_ :KYCUserDetailError?  ) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpointWithoutIpass.rawValue + KYCEndpoints.kycUserDetail.rawValue +  token + "&accountId=\(accountId)" + "&workflowExecutionId=\(workflowExecutionId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        ApiStore.shared.baseRequestApi(baseUrl, .get,nil,headers.dictionary) { (result : KYCUserDetailModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
    
    // MARK: - 21. Social Media Email
    open func GetSMAccByMobileNo(token:String,jwtToken:String,phoneNo:String, completion :@escaping(_ : SMPhoneModel?,_ : SMPhoneError?) -> Void){
        
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.smediaPhone.rawValue +  token
        let params = [ "phone_number": phoneNo]
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":jwtToken]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result: SMPhoneModel? ) in
            if result?.message == "Fail" {
                // print(result?.error)
                completion(nil,(result?.error)!)
            } else if result?.message == "Success" {
                
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 22. Social Media Phone
    open func  getSMAccByEmail(token:String,jwtToken:String,email:String, completion :@escaping(_ : GetSocialPassModel?, _ : GetSocialError?) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.smediaEmail.rawValue +  token
        let params = [ "email": email]
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":jwtToken]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result: GetSocialPassModel? ) in
            print(result as Any)
            if result?.message == "Fail" {
                completion(nil,(result?.error)!)
            } else if result?.message == "Success" {
                completion(result, nil)
            }
        }
    }
    
    // MARK: - 23. Upload Passport Image
    open func uploadPassport(token:String,authToken:String,imgData:String, completion : @escaping(_:PassPostModel?,_ :ErrorBase?  ) -> Void){
        
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.drivingPostData.rawValue +  token
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        let params : [String: String] = [
            "image" : imgData,
        ]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result : PassPostModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
    
    // MARK: - 24. Upload Driving Licence
    open func uploadDrivingLic(token:String,authToken:String,imgData:String, completion : @escaping(_:PassPostModel?,_ :ErrorBase?  ) -> Void){
        
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.drivingPostData.rawValue +  token
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        let params : [String: String] = [
            "image" : imgData,
        ]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result : PassPostModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
            
        }
    }
    
    // MARK: - 25. Upload Id Card Front Image
    open func uploadIDCardFrontImage(token:String,authToken:String,imgData:String, completion : @escaping(_:PassPostModel?,_ :ErrorBase?  ) -> Void){
        
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.drivingPostData.rawValue +  token
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        let params : [String: String] = [
            "image" : imgData,
        ]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result : PassPostModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
            
        }
    }
    
    // MARK: - 26. Upload Id Card Back Image
    open func uploadIDCardBackImage(token:String,authToken:String,imgData:String, completion : @escaping(_:PassPostModel?,_ :ErrorBase?  ) -> Void){
        
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.drivingPostData.rawValue +  token
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        let params : [String: String] = [
            "image" : imgData,
        ]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result : PassPostModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
            
        }
    }
    
    // MARK: - 27  Upload Document
    open func uploadDocument(token:String,authToken:String,imgData:String, completion : @escaping(_:PassPostModel?,_ :ErrorBase?  ) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.drivingPostData.rawValue +  token
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":authToken]
        let params : [String: String] = [
            "image" : imgData,
        ]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,headers.dictionary) { (result : PassPostModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
    
    // MARK: - 28- 32 Uploaded Document Data
    open func getDataOfType(token:String,jwtToken:String,apimId:String,documentType:String ,completion : @escaping(_ : [String : Any]?)->Void){
        
        switch(documentType){
        case "Passport": //Get Passport Image Data
            self.baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.passportGetData.rawValue +  token + "&apimId=\(apimId)"
        case "DrivingLicence": //Get Driving License Image Data
            self.baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.drivingGetData.rawValue +  token + "&apimId=\(apimId)"
        case "FrontIDCard": //Get Id Card Front Image
            self.baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.idCardGetFRNTData.rawValue +  token + "&apimId=\(apimId)"
        case "BackIDCard": //Get Id Card Back Image
            self.baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.idCardGetBackData.rawValue +  token + "&apimId=\(apimId)"
        case "Document":  // Get Document Data
            self.baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.documentGetData.rawValue +  token + "&apimId=\(apimId)"
        default:
            self.baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.documentGetData.rawValue +  token + "&apimId=\(apimId)"
        }
        
        let baseUrl1 = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.idCardGetBackData.rawValue +  token + "&apimId=\(apimId)"
        let headers: HTTPHeaders = ["Content-Type": "application/json","Accept": "application/json","Authorization":jwtToken]
        ApiStore.shared.baseRequestApi11(baseUrl1, .get, nil,headers.dictionary) { response in
            completion(response)
        }
    }
    
   // MARK: - Get Validate Document Data
    open func getValidateDocumentData(token:String,imgData:String, completion : @escaping(_:GetValidateDocumentModel?,_ :ErrorBase?  ) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.validateDocument.rawValue +  token
        let params : [String: String] = [
            "image" : imgData
        ]
        
        ApiStore.shared.baseRequestApi(baseUrl, .post,params,nil) { (result : GetValidateDocumentModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
    
    // MARK: - Get Screening Document Data
    open func getScreeningDocumentData(token:String,imgData:String, completion : @escaping(_:GetScreeningDocumentDataModel?,_ :ErrorBase?  ) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.screeningDocument.rawValue + token
        let params : [String: String] = [
            "image" : imgData
        ]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params) { (result : GetScreeningDocumentDataModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
    
    // MARK: - Get The Handwritten api Document Data
    open func getHandwrittenDocumentData(token:String,imgData:String, completion : @escaping(_:HandwrittenDocumentModel?,_ :ErrorBase?  ) -> Void){
        let baseUrl = BaseUrl.baseUrl.rawValue + VersionEndpoint.userEndpoint.rawValue + Endpoints.handwrittenDocument.rawValue + token
        let params : [String: String] = [
            "image" : imgData,
        ]
        ApiStore.shared.baseRequestApi(baseUrl, .post,params) { (result : HandwrittenDocumentModel?) in
            if result?.message == "Fail"{
                print("Error----",result?.error as Any)
                completion(nil,result?.error)
            } else if (result?.message == "Success"){
                completion(result,nil)
            }
        }
    }
}

