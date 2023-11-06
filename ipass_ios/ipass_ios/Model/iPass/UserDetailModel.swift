// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//  let UserDetailModel = try? JSONDecoder().decode(UserDetailModel.self, from: jsonData)

import Foundation

// MARK: - UserDetailModel
public struct UserDetailModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: UserDetailData?
    public let error : UserDetailError?
}

// MARK: - DataClass
public struct UserDetailData: Codable {
    public let parseBody: ParseBody?
}

// MARK: - ParseBody
public struct ParseBody: Codable {
    public let workflow: Workflow
    public let account: UserDetailAccount
    public let createdAt, completedAt, wipedOutAt: String
    public let credentials: [UserCredential]
    public let decision: Decision
    public let steps: Steps
    public let capabilities: Capabilities
    public let issupadmin, sessionsid, pubprivkey, email: String
}

// MARK: - Account
public struct UserDetailAccount: Codable {
    public let id: String
}

// MARK: - Capabilities
public struct Capabilities: Codable {
}

// MARK: - Credential
public struct UserCredential: Codable {
    public let id, category: String
}

// MARK: - Decision
public struct Decision: Codable {
    public let type: String
    public let details: Details
    public let risk: Risk
}

// MARK: - Details
public struct Details: Codable {
    public let label: String
}

// MARK: - Risk
public struct Risk: Codable {
    public let score: Int
}

// MARK: - Steps
public struct Steps: Codable {
    public let href: String
}

// MARK: - Workflow
public struct Workflow: Codable {
    public let id, status, definitionKey, userReference: String
    public let customerInternalReference: String
}

// MARK: - Error
public struct UserDetailError: Codable {
    public let parseBody: ParseErrorBody?
}

// MARK: - ParseBody
public struct ParseErrorBody: Codable {
    public let type, title: String?
    public let status: Int?
    public let detail, issupadmin, sessionsid, pubprivkey: String?
    public let email: String?
}
