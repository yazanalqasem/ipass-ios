//  DeleteAccountDataModel.swift

import Foundation

// MARK: - DeleteAccountDataModel
public struct DeleteAccountDataModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: DeleteDataClass?
    public let error: ErrorBase?
}

// MARK: - DataClass
public struct DeleteDataClass: Codable {
}
