public struct Sleeper {
    let durationInSeconds: Int
    
    public init(durationInSeconds: Int) {
        self.durationInSeconds = durationInSeconds
    }

    func sleep() async throws {
        let nanoSeconds = durationInSeconds * 1_000_000_000
        try await Task.sleep(nanoseconds: UInt64(nanoSeconds))
    }
}
