//
//  KYCModel.swift
//  DemoipAa
//
//  Created by Mobile on 02/03/23.
//



import Foundation


//Optional("{\"status\":true,\"message\":\"Fail\",\"error\":{\"bdy\":{\"type\":\"about:blank\",\"title\":\"Bad Request: wrong value for the accountId\",\"status\":\"400\",\"detail\":\"[]\",\"instance\":\"/api/v1/accounts/e25d34f0-98af-4e41-a09c-4a2131409953000\"}},\"data\":{}}")

// MARK: - KYCError
public struct KYCModel: Codable {
    public let status: Bool?
    public let message: String?
    public let error: KYCError?
    public let data: KYCDataClass?
    //let data: DataClass
}

// MARK: - DataClass
public struct KYCDataClass: Codable {
    //let bdy: KYCDataBdy?
}

// MARK: - Error
public struct KYCError: Codable {
    public let bdy: KYCBdy?
    public let user :  ErrorData?
    //let user: KYCErrorUserDetail?
}

// MARK: - User
public struct KYCErrorUserDetail: Codable {
    public let title: String?
    public let status: Int?
    public let detail: String?
}


// MARK: - Bdy
public struct KYCBdy: Codable {
    public let type, title: String?
    public let status: String?
    public let detail: String?
    public let instance: String?
}

// MARK: - Bdy
public struct KYCDataBdy: Codable {
    public let timestamp: String?
    public let account: KYCDatAccount?
    public let workflowExecution: KYCDatWorkflowExecution?
}

// MARK: - Account
public struct KYCDatAccount: Codable {
    public let id: String?
}

// MARK: - WorkflowExecution
public struct KYCDatWorkflowExecution: Codable {
    public let id: String?
    public let credentials: [KYCDatCredential]?
}

// MARK: - Credential
public struct KYCDatCredential: Codable {
    public let id, category: String?
    public let allowedChannels: [String]?
    public let api: KYCDatAPI?
}

// MARK: - API
public struct KYCDatAPI: Codable {
    public let token: String?
    public let parts: KYCDatParts?
    public let workflowExecution: String?
}

// MARK: - Parts
public struct KYCDatParts: Codable {
    public let prepared_data: String?
}
