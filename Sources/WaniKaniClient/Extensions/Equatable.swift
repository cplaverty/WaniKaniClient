extension Equatable {
    func isEqual(to other: some Equatable) -> Bool {
        // Require exact match of types
        guard type(of: other) == Self.self, let other = other as? Self else {
            return false
        }
        
        return self == other
    }
}
