// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let kYCPrePareData = try? JSONDecoder().decode(KYCPrePareData.self, from: jsonData)

import Foundation

// MARK: - KYCPrePareData
public struct KYCPrePareData: Codable {
    public let status: Bool?
    public let message: String?
    public let error: KYCPrePareError?
    public let data: KYCPreDataClass?
}

// MARK: - DataClass
public struct KYCPreDataClass: Codable {
    public let parseBody: KYCParseBody?
}

// MARK: - ParseBody
public struct KYCParseBody: Codable {
    public let timestamp: String?
    public let account, workflowExecution: KYCAccount?
    public let api: KYCAPI?
}

// MARK: - Account
public struct KYCAccount: Codable {
    public let id: String?
}

// MARK: - API
public struct KYCAPI: Codable {
    public let parts: KYCParts?
    public let workflowExecution: String?
}

// MARK: - Parts
public struct KYCParts: Codable {
}

// MARK: - Error
public struct KYCPrePareError: Codable {
    public let bdy: Bdy?
    public let user : ErrorData?
    public let parseBody :KYCPrePareParseNdy?
}

public struct KYCPrePareParseNdy: Codable {
    public let title: String?
    public let status: Int?
    public let detail: String?
}
// MARK: - Bdy
public struct Bdy: Codable {
    public let type, title, status, detail: String?
    public let instance: String?
}
