protocol Requestable {
    var httpMethod: String { get }
    var domain: String { get }
    var path: String { get }
    var queryItems: [String: String] { get }
}
