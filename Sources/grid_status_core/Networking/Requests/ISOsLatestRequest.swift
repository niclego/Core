struct ISOLatestRequest: Requestable {
    static let factory = Self.init()
    
    private init() {}

    let httpMethod = NetworkManager.HttpMethod.get.method
    let domain = "https://api.gridstatus.io"
    let path = "/query/isos_latest"
    let queryItems = [String: String]()
}
