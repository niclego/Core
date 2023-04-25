public protocol Requestable {
    associatedtype ResponseType

    var responseMock: ResponseType { get }
    var httpMethod: String { get }
    var domain: String { get }
    var path: String { get }
    var queryItems: [String: String] { get }
}

extension Requestable {
    public typealias Action = () async throws -> ResponseType
}
