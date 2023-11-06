
import Foundation

// MARK: - IDCardFrontModel
public struct PostIDCardFrontModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: PostDataClass?
    public let error : PostIDCardError?
}
public struct PostIDCardError: Codable {
    public let bdy: PostIDCardBdy?
    public let user : UserStatusParse?
}

// MARK: - Bdy
public struct PostIDCardBdy: Codable {
    public let type, title, status, detail: String?
    public let instance: String?
}

// MARK: - DataClass
public struct PostDataClass: Codable {
    public let resp: PostResp?
}

// MARK: - Resp
public struct PostResp: Codable {
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
