//  KYCInitateModel.swift
//  iPassSDK1
//  Created by CS on 23/03/23.

import Foundation

// MARK: - Welcome
public struct KYCInitateModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: KYCInitateDataClass?
    public let error: KYCInitateError?
}

// MARK: - KYCInitateError
public struct KYCInitateError: Codable {
    public let bdy: KYCInitateErrorBdy?
}

// MARK: - KYCInitateErrorBdy
public struct KYCInitateErrorBdy: Codable {
    public let type, title, status, detail: String?
    public let instance: String?
}

// MARK: - KYCInitateDataClass
public struct KYCInitateDataClass: Codable {
    public let bdy: KYCInitateBdy?
}

// MARK: - KYCInitateBdy
public struct KYCInitateBdy: Codable {
    public let timestamp: String?
    public let account: KYCInitateAccount?
    public let workflowExecution: KYCInitateWorkflowExecution?
}

// MARK: - KYCInitateAccount
public struct KYCInitateAccount: Codable {
    public let id: String?
}

// MARK: - KYCInitateWorkflowExecution
public struct KYCInitateWorkflowExecution: Codable {
    public let id: String?
    public let credentials: [KYCInitateCredential]?
}

// MARK: - KYCInitateCredential
public struct KYCInitateCredential: Codable {
    public let id, category: String?
    public let allowedChannels: [String]?
    public let api: KYCInitateAPI?
}

// MARK: - KYCInitateAPI
public struct KYCInitateAPI: Codable {
    public let token: String?
    public let parts: KYCInitateParts?
    public let workflowExecution: String?
}

// MARK: - KYCInitateParts
public struct KYCInitateParts: Codable {
    public let preparedData: String?

    enum CodingKeys: String, CodingKey {
        case preparedData = "prepared_data"
    }
}
