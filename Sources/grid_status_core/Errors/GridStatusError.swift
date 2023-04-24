public enum GridStatusError: Error {
    case noIsosData
    
    enum NetworkError: Error {
        case invalidRequestURL
        case invalidQueryItems
        case invalidResponse
        case invalidStatusCode(Int)
    }
}
