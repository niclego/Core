public enum NetworkError: Error {
    case invalidRequestURL
    case invalidQueryItems
    case invalidResponse
    case invalidStatusCode(Int)
}

