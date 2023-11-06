// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let passPostModel = try? JSONDecoder().decode(PassPostModel.self, from: jsonData)

import Foundation

// MARK: - PassPostModel
public struct PassPostModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: PassDataClass?
    public let error: ErrorBase?
}

// MARK: - DataClass
public struct PassDataClass: Codable {
    public let resp: Resp
}
public struct PassportError: Codable {
    public let bdy: PassportBdy?
    public let userError : UserStatusParse?
}

// MARK: - Bdy
public struct PassportBdy: Codable {
    public let type, title, status, detail: String?
    public let instance: String?
}

// MARK: - Resp
public struct Resp: Codable {
    public let contentLength: String
    public let operationLocation: String
    public let xEnvoyUpstreamServiceTime, apimRequestID, strictTransportSecurity, xContentTypeOptions: String
    public let xMSRegion, date, connection: String

    enum CodingKeys: String, CodingKey {
        case contentLength = "content-length"
        case operationLocation = "operation-location"
        case xEnvoyUpstreamServiceTime = "x-envoy-upstream-service-time"
        case apimRequestID = "apim-request-id"
        case strictTransportSecurity = "strict-transport-security"
        case xContentTypeOptions = "x-content-type-options"
        case xMSRegion = "x-ms-region"
        case date, connection
    }
}
