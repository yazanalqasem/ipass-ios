// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let accountTokenModel = try? JSONDecoder().decode(AccountTokenModel.self, from: jsonData)

import Foundation

// MARK: - AccountTokenModel
public struct AccountTokenModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: AccountTokenData?
    public let error: ErrorBase?
}

// MARK: - DataClass
public struct AccountTokenData: Codable {
    public let accdata: Accdata?
}

// MARK: - Accdata
public struct Accdata: Codable {
    public let timestamp: String?
    public let account: Account?
    public let web: Web?
    public let sdk: SDK?
    public let workflowExecution: WorkflowExecution?
}

// MARK: - Account
public struct Account: Codable {
    public let id: String?
}

// MARK: - SDK
public struct SDK: Codable {
    public let token: String?
}

// MARK: - Web
public struct Web: Codable {
    public let href, successURL, errorURL: String?

    enum CodingKeys: String, CodingKey {
        case href
        case successURL = "successUrl"
        case errorURL = "errorUrl"
    }
}

// MARK: - WorkflowExecution
public struct WorkflowExecution: Codable {
    public let id: String
    public let credentials: [Credential]
}

// MARK: - Credential
public struct Credential: Codable {
    public let id, category: String
    public let allowedChannels: [String]
    public let api: API?
}

// MARK: - API
public struct API: Codable {
    public let token: String
    public let parts: Parts
    public let workflowExecution: String
}

// MARK: - Parts
public struct Parts: Codable {
    public let front, back, face: String?
}
