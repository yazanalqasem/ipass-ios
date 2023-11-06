// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let kYCPUTPrePareData = try? JSONDecoder().decode(KYCPUTPrePareData.self, from: jsonData)

import Foundation

// MARK: - KYCPUTPrePareData
public struct KYCPUTPrePareData: Codable {
    public let status: Bool?
    public let message: String?
    public let error: KYCPUTPrePareError?
    public let data: KYCPUTPrePareDataDataClass?
}

// MARK: - DataClass
public struct KYCPUTPrePareDataDataClass: Codable {
    public let parsebody: Parsebody?
}

// MARK: - Parsebody
public struct Parsebody: Codable {
    public let body: String?
}

// MARK: - Error
public struct KYCPUTPrePareError: Codable {
    public let bdy: KYCPUTPrePareBdy?
    public let user :  ErrorData?
}

// MARK: - Bdy
public struct KYCPUTPrePareBdy: Codable {
    public let type, title, status, detail: String?
    public let instance: String?
}
