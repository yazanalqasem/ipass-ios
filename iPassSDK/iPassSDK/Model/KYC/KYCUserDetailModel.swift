//  KYCUserDetailModel.swift
//  iPassSDK1
//  Created by CS on 23/03/23.

import Foundation

// MARK: - KYCUserDetailModel
public struct KYCUserDetailModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: KYCUserDetailWelcomeData?
    public let error: KYCUserDetailError?
}

// MARK: - KYCUserDetailError
public struct KYCUserDetailError: Codable {
    public let bdy: KYCUserDetailBdy?
}

// MARK: - KYCUserDetailBdy
public struct KYCUserDetailBdy: Codable {
    public let type, title, status, detail: String?
    public let instance: String?
}

// MARK: - KYCUserDetailWelcomeData
public struct KYCUserDetailWelcomeData: Codable {
    public let parseBody: KYCUserDetailParseBody?
}

// MARK: - KYCUserDetailParseBody
public struct KYCUserDetailParseBody: Codable {
    public let workflow: KYCUserDetailWorkflow?
    public let account: KYCUserDetailAccount?
    public let createdAt, completedAt: String?
    public let credentials: [KYCUserDetailCredential]?
    public let decision: KYCUserDetailParseBodyDecision?
    public let steps: KYCUserDetailSteps?
    public let capabilities: KYCUserDetailCapabilities?
}

// MARK: - KYCUserDetailAccount
public struct KYCUserDetailAccount: Codable {
    public let id: String?
}

// MARK: - KYCUserDetailCapabilities
public struct KYCUserDetailCapabilities: Codable {
    public let watchlistScreening: [KYCUserDetailWatchlistScreening]?
}

// MARK: - KYCUserDetailWatchlistScreening
public struct KYCUserDetailWatchlistScreening: Codable {
    public let id: String?
    public let decision: KYCUserDetailWatchlistScreeningDecision?
    public let data: KYCUserDetailWatchlistScreeningData?
}

// MARK: - KYCUserDetailWatchlistScreeningData
public struct KYCUserDetailWatchlistScreeningData: Codable {
}

// MARK: - KYCUserDetailWatchlistScreeningDecision
public struct KYCUserDetailWatchlistScreeningDecision: Codable {
    public let type: String?
    public let details: KYCUserDetailDetails?
}

// MARK: - KYCUserDetailDetails
public struct KYCUserDetailDetails: Codable {
    public let label: String?
}

// MARK: - KYCUserDetailCredential
public struct KYCUserDetailCredential: Codable {
    public let id, category: String?
    public let parts: [KYCUserDetailPart]?
}

// MARK: - KYCUserDetailPart
public struct KYCUserDetailPart: Codable {
    public let classifier: String?
    public let href: String?
}

// MARK: - KYCUserDetailParseBodyDecision
public struct KYCUserDetailParseBodyDecision: Codable {
    public let type: String?
    public let details: KYCUserDetailDetails?
    public let risk: KYCUserDetailRisk?
}

// MARK: - KYCUserDetailRisk
public struct KYCUserDetailRisk: Codable {
    public let score: Int?
}

// MARK: - KYCUserDetailSteps
public struct KYCUserDetailSteps: Codable {
    public let href: String?
}

// MARK: - KYCUserDetailWorkflow
public struct KYCUserDetailWorkflow: Codable {
    public let id, status, definitionKey, customerInternalReference: String?
}
