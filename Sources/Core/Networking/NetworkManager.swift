import Foundation

public protocol NetworkManagable {
    func request<T: Decodable>(request: any Requestable) async throws -> T
}

public struct NetworkManagerMock: NetworkManagable {
    public init() {}
    public func request<T>(request: any Requestable) async throws -> T where T : Decodable {
        print("Mock request completed for : \(request.path)")
        return request.responseMock as! T
    }
}

public struct NetworkManager: NetworkManagable {
    let session = URLSession.shared
    
    public init() {}
        
    public enum HttpMethod: String {
        case get
        case post

        public var method: String { rawValue.uppercased() }
    }

    public func request<T: Decodable>(
        request: any Requestable
    ) async throws -> T {
        guard var urlComponents = URLComponents(string: request.domain + request.path) else { throw NetworkError.invalidRequestURL }

        urlComponents.queryItems = request.queryItems.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }

        guard let url = urlComponents.url else { throw NetworkError.invalidQueryItems }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod

        let ( data, response ) = try await session.data(for: urlRequest)
        print("Live Request completed for : \(request.path)")

        guard let urlResponse = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }

        guard urlResponse.statusCode == 200 else { throw NetworkError.invalidStatusCode(urlResponse.statusCode) }
        
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
}
