//  KYCWorkflowStatusModel.swift
//  iPassSDK1
//  Created by CS on 23/03/23.

import Foundation

// MARK: - KYCWorkflowStatusModel
public struct KYCWorkflowStatusModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: KYCWorkflowStatusDataClass?
    public let error: KYCWorkflowStatusError?
}

// MARK: - KYCWorkflowStatusError
public struct KYCWorkflowStatusError: Codable {
    public let statusParse: KYCWorkflowStatusStatusParse?
}

// MARK: - KYCWorkflowStatusStatusParse
public struct KYCWorkflowStatusStatusParse: Codable {
    public let title: String?
    public let status: Int?
    public let detail: String?
}

// MARK: - KYCWorkflowStatusDataClass
public struct KYCWorkflowStatusDataClass: Codable {
    public let statusParse: KYCWorkflowStatusParses?
}

// MARK: - KYCWorkflowStatusParses
public struct KYCWorkflowStatusParses: Codable {
    public let account: KYCWorkflowStatusAccount?
    public let workflowExecution: KYCWorkflowStatusWorkflowExecution?
}

// MARK: - KYCWorkflowStatusAccount
public struct KYCWorkflowStatusAccount: Codable {
    public let id: String?
    public let href: String?
}

// MARK: - KYCWorkflowStatusWorkflowExecution
public struct KYCWorkflowStatusWorkflowExecution: Codable {
    public let id: String?
    public let href: String?
    public let definitionKey, status: String?
}
