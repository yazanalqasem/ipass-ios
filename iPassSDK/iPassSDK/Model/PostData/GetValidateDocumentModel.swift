//  GetValidateDocumentModel.swift
//  iPassSDK1
//  Created by CS on 18/04/23.

import Foundation

// MARK: - GetValidateDocumentModel
public struct GetValidateDocumentModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: GetValidateDocumentDataClass?
    public let error: ErrorBase?
}

// MARK: - GetValidateDocumentDataClass
public struct GetValidateDocumentDataClass: Codable {
    public let resParse: ResParse?
}

// MARK: - ResParse
public struct ResParse: Codable {
    public let alert: Bool?
    public let resourceType: String?
    public let fraud: Fraud?
    public let requestID, timestamp, version: String?

    enum CodingKeys: String, CodingKey {
        case alert
        case resourceType = "resource_type"
        case fraud
        case requestID = "request_id"
        case timestamp, version
    }
}

// MARK: - Fraud
public struct Fraud: Codable {
    public let alert: Bool?
    public let localTraces: LocalTraces?
    public let globalTraces: GlobalTraces?
    public let warnings: [String]?

    enum CodingKeys: String, CodingKey {
        case alert
        case localTraces = "local_traces"
        case globalTraces = "global_traces"
        case warnings
    }
}

// MARK: - GlobalTraces
public struct GlobalTraces: Codable {
    public let alert: Bool?
    public let editor: String?
}

// MARK: - LocalTraces
public struct LocalTraces: Codable {
    public let alert: Bool?
    public let digitalForgeries: DigitalForgeries?
    public let map: String?

    enum CodingKeys: String, CodingKey {
        case alert
        case digitalForgeries = "digital_forgeries"
        case map
    }
}

// MARK: - DigitalForgeries
public struct DigitalForgeries: Codable {
    public let alert: Bool?
    public let score, threshold: Double?
}
