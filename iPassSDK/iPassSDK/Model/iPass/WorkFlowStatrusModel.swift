//
//  WorkFlowStatrusModel.swift
//  DemoipAa
//
//  Created by Mobile on 01/03/23.
//

import Foundation
//
// MARK: - WorkFlowStatrusModel
public struct WorkFlowStatusModel: Codable {
    public let status: Bool?
    public let message: String?
    public let error: WorkFlowStatusError?
    public let data: WorkFlowDataClass?
}

// MARK: - Error
public struct WorkFlowStatusError: Codable {
    public let statusParse: WorkFlowStatusParse?
    public let user: WorkflowDataUser?
    public let bdy: WorkflowDataBdyError?
}

// MARK: - DataClass
public struct WorkFlowDataClass: Codable {
    public let statusParse: WorkFlowStatusDataParse?
}
public struct WorkflowDataBdyError: Codable{
    public let type, title: String?
    public let status: Int?
    public let detail,instance: String?
}
// MARK: - StatusParse
public struct WorkFlowStatusParse: Codable {
    public let type, title: String?
    public let status: Int?
    public let detail: String?
}

// MARK: - StatusParse
public struct WorkFlowStatusDataParse: Codable {
    public let account: WorkFlowAccount?
    public let workflowExecution: WorkflowDataExecution?
}

// MARK: - Account
public struct WorkFlowAccount: Codable {
    public let id: String?
    public let href: String?
}

public struct WorkflowDataExecution: Codable {
    public let id: String?
    public let href: String?
    public let definitionKey, status: String?
}

// MARK: - User
public struct WorkflowDataUser: Codable {
    public let title: String?
    public let status: Int?
    public let detail: String?
}
