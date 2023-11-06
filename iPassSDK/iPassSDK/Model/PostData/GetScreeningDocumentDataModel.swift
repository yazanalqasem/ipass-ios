//  GetScreeningDocumentDataModel.swift
//  iPassSDK1
//  Created by CS on 18/04/23.

import Foundation

// MARK: - GetScreeningDocumentDataModel
public struct GetScreeningDocumentDataModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: GetScreeningDocumentDataClass?
    public let error: ErrorBase?
}

// MARK: - GetScreeningDocumentDataClass
public struct GetScreeningDocumentDataClass: Codable {
    public let resParse: GetScreeningDocumentResParse?
}

// MARK: - GetScreeningDocumentResParse
public struct GetScreeningDocumentResParse: Codable {
    public let alert: Bool?
    public let resourceType: String?
    public let identity: Identity?
    public let requestID, timestamp, version: String?

    enum CodingKeys: String, CodingKey {
        case alert
        case resourceType = "resource_type"
        case identity
        case requestID = "request_id"
        case timestamp, version
    }
}

// MARK: - Identity
public struct Identity: Codable {
    public let alert: Bool?
    public let screen, print: Print?
}

// MARK: - Print
public struct Print: Codable {
    public let alert: Bool?
    public let score, threshold: Double?
}
