import Combine

public protocol CoreProtocol {
    func requestGenerator <T: Decodable>(
        request: any Requestable
    ) -> () async throws -> T
    
    func streamGenerator<T>(
        sleeper: Sleeper,
        action: @escaping () async throws -> T
    ) -> AsyncThrowingStream<T, Error>
}

public struct Core: CoreProtocol {
    let networkManager: NetworkManagable

    public init(
        networkManager: NetworkManagable
    ) {
        self.networkManager = networkManager
    }
    
    public func requestGenerator<T: Decodable>(
        request: any Requestable
    ) -> () async throws -> T {
        return {
            let response: T = try await networkManager.request(request: request)
            return response
        }
    }

    public func streamGenerator<T>(
        sleeper: Sleeper,
        action: @escaping () async throws -> T
    ) -> AsyncThrowingStream<T, Error> {
        return AsyncThrowingStream {
            try await sleeper.sleep()
            return try await action()
        }
    }
}
