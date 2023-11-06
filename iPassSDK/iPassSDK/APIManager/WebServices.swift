//  WebServices.swift
//  Lumakin
//  Created by Mobile on 20/02/23.

import Foundation
import Alamofire

// MARK: - Version
public enum BaseUrl : String {
    case baseUrl = "https://api.ipass-mena.com/"
    //case baseUrlLocalHost = "http://192.168.11.55:5200/"
    // case imageBaseUrl = "http://192.168.11.55:5200/public/uploads/"
    case token = "eyJhbGciOiJIUzI1NiJ9.bXJ2ZXJtYTkxMzc4QGdtYWlsLmNvbWFqYXkga3VtYXI.H9agOLfRpnWywRo3alp75OeblSADsKsGDxVVUtheMyk"
}

// MARK: - Version
public enum VersionEndpoint : String {
    case userEndpoint = "api/v1/ipass/"
    case userEndpointWithoutIpass = "api/v1/"
}

// MARK: - Endpoints
public enum Endpoints : String {
    case jwtToken = "create/jwttoken?token="
    case token = "account/token?token="
    case workFlowStatus = "workflow/status?token="
    case detailUser = "detail/user?token="
    case frontimage = "get/front/image"
    case backImage = "get/back/image"
    case faceImage = "get/face/image"
    case liveness1 = "get/liveness/image1"
    case liveness2 = "get/liveness/image2"
    case liveness3 = "get/liveness/image3"
    case liveness4 = "get/liveness/image4"
    case liveness5 = "get/liveness/image5"
    case liveness6 = "get/liveness/image6"
    case deleteAccData = "delete/account/data?token="
    case deleteAccount = "delete/alldata?token="
   
    case smediaPhone = "social/media/phone?token="
    case smediaEmail = "social/media/email?token="
    case passportPostData = "passport/postdata?token="
    case passportGetData = "passport/getdata?token="
    case drivingPostData = "driving/postdata?token="
    case drivingGetData = "driving/getdata?token="
    
    case idCardPostFRNTData = "idcard/postfrntdata?token="
    case idCardGetFRNTData = "idcard/getfrntdata?token="
    case idCardPostBackData = "idcard/postbackdata?token="
    case idCardGetBackData = "idcard/getbackdata?token="
    case documentPostData = "doc/postdata?token="
    case documentGetData = "doc/getdata?token="
    
    case validateDocument = "document/validate"
    case screeningDocument = "document/screening/data"
    case handwrittenDocument = "handwritten/document"
}

//https://api.ipass-mena.com/api/v1/ipass/social/media/phone?token=eyJhbGciOiJIUzI1NiJ9.bXJ2ZXJtYTkxMzc4QGdtYWlsLmNvbWFqYXkga3VtYXI.H9agOLfRpnWywRo3alp75OeblSADsKsGDxVVUtheMyk
public enum KYCEndpoints : String {
    case initKYCAccount = "kyc/initate/account?token="
    case kycPrepareData = "kyc/prepare_data?token="
    case kycPUTPrepareData = "kyc/putprepare/data?token="
    case kycWorkFlowStatus = "ipass/kyc/workflow/status?token="
    case kycUserDetail = "iPass/kyc/user/detail?token="
    
}


class WebServices : NSObject {
    
    // MARK: - Shared Instance
    static let shared = WebServices()
    
    // MARK: - 1. Phone number exist or not
    
}


