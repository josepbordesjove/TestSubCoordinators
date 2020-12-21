import Foundation

extension Array {
    public subscript(ifExists index: Index) -> Element? {
        guard indices.contains(index) else {
            assertionFailure("Provided index is out of array bounds")
            return nil
        }
        return self[index]
    }
}
